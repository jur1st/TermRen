# API Usage Safeguards & Emergency Protocols

## Overview
This document provides comprehensive technical safeguards for monitoring API usage costs and implementing emergency response procedures to prevent runaway spending.

## Real-Time Cost Monitoring Systems

### 1. Automated Billing Alert Setup

#### AWS Cost Monitoring
```bash
# Create billing alert for 50% of monthly budget
aws budgets create-budget \
  --account-id YOUR_ACCOUNT_ID \
  --budget '{
    "BudgetName": "API-Usage-Alert-50",
    "BudgetLimit": {
      "Amount": "50.00",
      "Unit": "USD"
    },
    "TimeUnit": "MONTHLY",
    "BudgetType": "COST"
  }'

# Create notification for 75% threshold
aws budgets create-notification \
  --account-id YOUR_ACCOUNT_ID \
  --budget-name "API-Usage-Alert-50" \
  --notification '{
    "NotificationType": "ACTUAL",
    "ComparisonOperator": "GREATER_THAN",
    "Threshold": 75.0,
    "ThresholdType": "PERCENTAGE"
  }'
```

#### OpenAI Cost Monitoring
```bash
# Daily cost check script
#!/bin/bash
OPENAI_API_KEY="your-api-key"
DAILY_LIMIT=5.00
MONTHLY_LIMIT=100.00

# Check current usage
USAGE=$(curl -s -H "Authorization: Bearer $OPENAI_API_KEY" \
  "https://api.openai.com/v1/usage" | jq '.total_usage')

if (( $(echo "$USAGE > $DAILY_LIMIT" | bc -l) )); then
  echo "ALERT: Daily usage exceeded $DAILY_LIMIT"
  # Trigger emergency procedures
  source ./emergency-shutdown.sh
fi
```

### 2. Continuous Monitoring Dashboard

#### Grafana Dashboard Setup
```yaml
# grafana-dashboard.yml
apiVersion: 1
datasources:
  - name: CloudWatch
    type: cloudwatch
    access: proxy
    jsonData:
      defaultRegion: us-east-1

panels:
  - title: "API Cost Trends"
    type: graph
    targets:
      - expr: aws_billing_estimated_charges
        legendFormat: "Estimated Charges"
  
  - title: "Request Volume"
    type: stat
    targets:
      - expr: sum(rate(api_requests_total[5m]))
        legendFormat: "Requests/sec"
```

#### Prometheus Metrics Collection
```yaml
# prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'api-cost-exporter'
    static_configs:
      - targets: ['localhost:9090']
    scrape_interval: 60s
```

## Emergency Shutdown Procedures

### 1. Immediate Shutdown Script
```bash
#!/bin/bash
# emergency-shutdown.sh

echo "EMERGENCY SHUTDOWN INITIATED"
echo "Timestamp: $(date)"

# Stop all running API processes
pkill -f "api-client"
pkill -f "claude-code"

# Disable API keys (rotate to invalid)
export OPENAI_API_KEY="DISABLED_$(date +%s)"
export ANTHROPIC_API_KEY="DISABLED_$(date +%s)"

# Kill all Python processes using APIs
ps aux | grep -i "openai\|anthropic\|claude" | awk '{print $2}' | xargs kill -9

# Log the shutdown
echo "Emergency shutdown completed at $(date)" >> /var/log/api-emergency.log

# Send alert
curl -X POST https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK \
  -H 'Content-type: application/json' \
  --data '{"text":"EMERGENCY: API usage shutdown initiated"}'
```

### 2. Service-Specific Shutdowns

#### Docker Container Shutdown
```bash
# Stop all API-related containers
docker stop $(docker ps -q --filter "label=api-service")
docker rm $(docker ps -aq --filter "label=api-service")
```

#### Kubernetes Deployment Shutdown
```bash
# Scale down all API deployments
kubectl scale deployment --all --replicas=0 -n api-namespace

# Delete high-cost pods immediately
kubectl delete pods -l cost-tier=high --force --grace-period=0
```

## Budget Tracking & Threshold Management

### 1. Multi-Tier Alert System

#### Threshold Configuration
```json
{
  "budget_thresholds": {
    "daily": {
      "warning": 5.00,
      "critical": 8.00,
      "emergency": 10.00
    },
    "weekly": {
      "warning": 25.00,
      "critical": 35.00,
      "emergency": 50.00
    },
    "monthly": {
      "warning": 75.00,
      "critical": 90.00,
      "emergency": 100.00
    }
  },
  "actions": {
    "warning": ["log", "email"],
    "critical": ["log", "email", "sms", "reduce_limits"],
    "emergency": ["shutdown", "disable_keys", "alert_all"]
  }
}
```

#### Budget Enforcement Script
```bash
#!/bin/bash
# budget-enforcer.sh

CONFIG_FILE="budget-config.json"
CURRENT_SPEND=$(get_current_spend.sh)
THRESHOLD_WARNING=$(jq -r '.budget_thresholds.daily.warning' $CONFIG_FILE)
THRESHOLD_CRITICAL=$(jq -r '.budget_thresholds.daily.critical' $CONFIG_FILE)
THRESHOLD_EMERGENCY=$(jq -r '.budget_thresholds.daily.emergency' $CONFIG_FILE)

if (( $(echo "$CURRENT_SPEND > $THRESHOLD_EMERGENCY" | bc -l) )); then
  echo "EMERGENCY THRESHOLD EXCEEDED"
  ./emergency-shutdown.sh
elif (( $(echo "$CURRENT_SPEND > $THRESHOLD_CRITICAL" | bc -l) )); then
  echo "CRITICAL THRESHOLD EXCEEDED"
  ./reduce-api-limits.sh
  ./send-critical-alert.sh
elif (( $(echo "$CURRENT_SPEND > $THRESHOLD_WARNING" | bc -l) )); then
  echo "WARNING THRESHOLD EXCEEDED"
  ./send-warning-alert.sh
fi
```

### 2. Automated Spending Caps

#### Rate Limiting Implementation
```bash
#!/bin/bash
# rate-limiter.sh

# Implement token bucket algorithm
BUCKET_SIZE=100
REFILL_RATE=10
BUCKET_FILE="/tmp/api_bucket"

# Initialize bucket if doesn't exist
if [[ ! -f "$BUCKET_FILE" ]]; then
  echo "$BUCKET_SIZE" > "$BUCKET_FILE"
fi

# Check if request is allowed
current_tokens=$(cat "$BUCKET_FILE")
if (( current_tokens > 0 )); then
  echo $((current_tokens - 1)) > "$BUCKET_FILE"
  exit 0  # Request allowed
else
  exit 1  # Request denied
fi
```

## Alert Systems & Notification Protocols

### 1. Multi-Channel Alerting

#### Slack Integration
```bash
#!/bin/bash
# slack-alert.sh

WEBHOOK_URL="https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK"
SEVERITY=$1
MESSAGE=$2

case $SEVERITY in
  "warning")
    COLOR="#ffcc00"
    EMOJI=":warning:"
    ;;
  "critical")
    COLOR="#ff6600"
    EMOJI=":exclamation:"
    ;;
  "emergency")
    COLOR="#ff0000"
    EMOJI=":rotating_light:"
    ;;
esac

curl -X POST "$WEBHOOK_URL" \
  -H 'Content-type: application/json' \
  --data "{
    \"attachments\": [{
      \"color\": \"$COLOR\",
      \"title\": \"$EMOJI API Cost Alert - $SEVERITY\",
      \"text\": \"$MESSAGE\",
      \"ts\": $(date +%s)
    }]
  }"
```

#### Email Notifications
```bash
#!/bin/bash
# email-alert.sh

SEVERITY=$1
COST=$2
THRESHOLD=$3

cat << EOF | mail -s "API Cost Alert - $SEVERITY" admin@company.com
API Usage Alert: $SEVERITY

Current Cost: $COST
Threshold: $THRESHOLD
Timestamp: $(date)

Immediate Actions Required:
1. Review current API usage
2. Check for runaway processes
3. Implement cost reduction measures

Dashboard: https://monitoring.company.com/api-costs
EOF
```

### 2. Escalation Procedures

#### Automatic Escalation Chain
```bash
#!/bin/bash
# escalation-chain.sh

SEVERITY=$1
COST=$2

case $SEVERITY in
  "warning")
    # Notify team lead
    ./send-email.sh "team-lead@company.com" "API Cost Warning" "$COST"
    ;;
  "critical")
    # Notify team lead and manager
    ./send-email.sh "team-lead@company.com" "API Cost Critical" "$COST"
    ./send-sms.sh "+1234567890" "API CRITICAL: $COST"
    ;;
  "emergency")
    # Notify all stakeholders
    ./send-email.sh "emergency-list@company.com" "API EMERGENCY" "$COST"
    ./send-sms.sh "+1234567890" "API EMERGENCY: $COST"
    ./call-phone.sh "+1234567890" "API emergency shutdown initiated"
    ;;
esac
```

## Automated Safeguards

### 1. Circuit Breaker Pattern

#### API Circuit Breaker
```python
#!/usr/bin/env python3
# api-circuit-breaker.py

import time
import json
from enum import Enum

class CircuitState(Enum):
    CLOSED = "closed"
    OPEN = "open"
    HALF_OPEN = "half_open"

class APICircuitBreaker:
    def __init__(self, failure_threshold=5, recovery_timeout=60, cost_threshold=10.0):
        self.failure_threshold = failure_threshold
        self.recovery_timeout = recovery_timeout
        self.cost_threshold = cost_threshold
        self.failure_count = 0
        self.last_failure_time = None
        self.state = CircuitState.CLOSED
        self.current_cost = 0.0
    
    def call_api(self, api_function, *args, **kwargs):
        if self.state == CircuitState.OPEN:
            if self._should_attempt_reset():
                self.state = CircuitState.HALF_OPEN
            else:
                raise Exception("Circuit breaker is OPEN - API calls blocked")
        
        if self.current_cost > self.cost_threshold:
            self.state = CircuitState.OPEN
            self.last_failure_time = time.time()
            raise Exception(f"Cost threshold exceeded: ${self.current_cost}")
        
        try:
            result = api_function(*args, **kwargs)
            self._on_success()
            return result
        except Exception as e:
            self._on_failure()
            raise e
    
    def _should_attempt_reset(self):
        return (time.time() - self.last_failure_time) > self.recovery_timeout
    
    def _on_success(self):
        self.failure_count = 0
        self.state = CircuitState.CLOSED
    
    def _on_failure(self):
        self.failure_count += 1
        self.last_failure_time = time.time()
        if self.failure_count >= self.failure_threshold:
            self.state = CircuitState.OPEN
```

### 2. Automatic Request Queuing

#### Queue Management System
```bash
#!/bin/bash
# request-queue-manager.sh

QUEUE_DIR="/tmp/api-queue"
MAX_QUEUE_SIZE=1000
PROCESSING_RATE=10  # requests per minute

mkdir -p "$QUEUE_DIR"

# Add request to queue
queue_request() {
    local request_id=$(uuidgen)
    local request_data="$1"
    local queue_size=$(ls "$QUEUE_DIR" | wc -l)
    
    if (( queue_size >= MAX_QUEUE_SIZE )); then
        echo "ERROR: Queue full, rejecting request"
        return 1
    fi
    
    echo "$request_data" > "$QUEUE_DIR/$request_id"
    echo "Request queued: $request_id"
}

# Process queue
process_queue() {
    local processed=0
    local max_process=$((PROCESSING_RATE / 60))  # per minute
    
    for request_file in "$QUEUE_DIR"/*; do
        if [[ $processed -ge $max_process ]]; then
            break
        fi
        
        if [[ -f "$request_file" ]]; then
            # Process request
            process_api_request "$(cat "$request_file")"
            rm "$request_file"
            ((processed++))
        fi
    done
}
```

## Recovery Procedures

### 1. Service Recovery Checklist

#### Post-Incident Recovery
```bash
#!/bin/bash
# recovery-checklist.sh

echo "=== API SERVICE RECOVERY CHECKLIST ==="
echo "1. Verify all emergency processes are stopped"
echo "2. Check current billing status"
echo "3. Review incident logs"
echo "4. Validate API key status"
echo "5. Test service functionality"
echo "6. Gradually restore service levels"

# Automated checks
check_processes() {
    echo "Checking for running API processes..."
    ps aux | grep -E "(openai|anthropic|claude)" || echo "No API processes found"
}

check_billing() {
    echo "Current billing status:"
    ./get-current-spend.sh
}

validate_keys() {
    echo "Validating API keys..."
    # Test with minimal request
    curl -s -H "Authorization: Bearer $OPENAI_API_KEY" \
      "https://api.openai.com/v1/models" | jq '.data[0].id' || echo "API key invalid"
}

gradual_restoration() {
    echo "Implementing gradual service restoration..."
    
    # Start with 10% capacity
    ./set-rate-limit.sh 0.1
    sleep 300  # Wait 5 minutes
    
    # Increase to 50%
    ./set-rate-limit.sh 0.5
    sleep 300
    
    # Full restoration
    ./set-rate-limit.sh 1.0
    echo "Service fully restored"
}
```

### 2. Data Recovery Procedures

#### Backup and Restore
```bash
#!/bin/bash
# backup-restore.sh

BACKUP_DIR="/backup/api-data"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create backup before recovery
create_backup() {
    echo "Creating backup..."
    mkdir -p "$BACKUP_DIR"
    
    # Backup configuration
    cp -r SYSTEM-INSTRUCTIONS/ "$BACKUP_DIR/config_$TIMESTAMP/"
    
    # Backup logs
    cp /var/log/api-*.log "$BACKUP_DIR/logs_$TIMESTAMP/" 2>/dev/null
    
    # Backup database
    mysqldump api_database > "$BACKUP_DIR/db_$TIMESTAMP.sql"
    
    echo "Backup completed: $BACKUP_DIR"
}

# Restore from backup
restore_backup() {
    local backup_timestamp=$1
    
    echo "Restoring from backup: $backup_timestamp"
    
    # Restore configuration
    cp -r "$BACKUP_DIR/config_$backup_timestamp/"* SYSTEM-INSTRUCTIONS/
    
    # Restore database
    mysql api_database < "$BACKUP_DIR/db_$backup_timestamp.sql"
    
    echo "Restore completed"
}
```

## Incident Documentation

### 1. Automated Incident Logging

#### Incident Report Generator
```bash
#!/bin/bash
# incident-report.sh

INCIDENT_ID=$(uuidgen)
TIMESTAMP=$(date)
COST_AT_INCIDENT=$(./get-current-spend.sh)

cat > "incident_$INCIDENT_ID.md" << EOF
# API Cost Incident Report - $INCIDENT_ID

## Incident Details
- **Timestamp**: $TIMESTAMP
- **Cost at Incident**: \$$COST_AT_INCIDENT
- **Triggered By**: $1
- **Severity**: $2

## Timeline
$(cat /var/log/api-emergency.log | tail -20)

## Actions Taken
- Emergency shutdown initiated
- API keys disabled
- All processes terminated
- Stakeholders notified

## Root Cause Analysis
[To be filled during post-incident review]

## Prevention Measures
[To be filled during post-incident review]

## Follow-up Actions
- [ ] Review and update cost thresholds
- [ ] Improve monitoring coverage
- [ ] Update emergency procedures
- [ ] Team training on incident response

## Lessons Learned
[To be filled during post-incident review]
EOF

echo "Incident report created: incident_$INCIDENT_ID.md"
```

### 2. Metrics Collection for Analysis

#### Cost Analysis Script
```bash
#!/bin/bash
# cost-analysis.sh

ANALYSIS_PERIOD=${1:-7}  # days
OUTPUT_FILE="cost-analysis-$(date +%Y%m%d).json"

# Collect cost data
collect_cost_data() {
    echo "Collecting cost data for last $ANALYSIS_PERIOD days..."
    
    # AWS costs
    aws ce get-cost-and-usage \
      --time-period Start=$(date -d "$ANALYSIS_PERIOD days ago" +%Y-%m-%d),End=$(date +%Y-%m-%d) \
      --granularity DAILY \
      --metrics BlendedCost > aws_costs.json
    
    # OpenAI costs (if available)
    curl -s -H "Authorization: Bearer $OPENAI_API_KEY" \
      "https://api.openai.com/v1/usage?date=$(date -d "$ANALYSIS_PERIOD days ago" +%Y-%m-%d)" \
      > openai_costs.json
    
    # Combine data
    jq -n \
      --argjson aws "$(cat aws_costs.json)" \
      --argjson openai "$(cat openai_costs.json)" \
      '{
        "analysis_period": "'$ANALYSIS_PERIOD'",
        "generated_at": "'$(date)'",
        "aws_costs": $aws,
        "openai_costs": $openai,
        "total_incidents": '$(grep -c "Emergency shutdown" /var/log/api-emergency.log)'
      }' > "$OUTPUT_FILE"
    
    echo "Analysis saved to: $OUTPUT_FILE"
}

# Generate report
generate_report() {
    echo "=== COST ANALYSIS REPORT ==="
    echo "Period: Last $ANALYSIS_PERIOD days"
    echo "Generated: $(date)"
    echo
    
    # Calculate averages
    avg_daily_cost=$(jq -r '.aws_costs.ResultsByTime[] | .Total.BlendedCost.Amount' aws_costs.json | 
                     awk '{sum+=$1} END {print sum/NR}')
    
    echo "Average Daily Cost: \$$avg_daily_cost"
    echo "Total Incidents: $(grep -c "Emergency shutdown" /var/log/api-emergency.log)"
    echo "Most Expensive Day: $(jq -r '.aws_costs.ResultsByTime | max_by(.Total.BlendedCost.Amount | tonumber) | .TimePeriod.Start' aws_costs.json)"
}

collect_cost_data
generate_report
```

## Emergency Contact Information

### Primary Contacts
- **Team Lead**: team-lead@company.com | +1-555-0101
- **Engineering Manager**: eng-manager@company.com | +1-555-0102
- **DevOps Engineer**: devops@company.com | +1-555-0103

### Secondary Contacts
- **CTO**: cto@company.com | +1-555-0104
- **Finance Team**: finance@company.com | +1-555-0105
- **On-Call Engineer**: oncall@company.com | +1-555-0106

### Emergency Escalation
1. **Level 1**: Automated alerts to team lead
2. **Level 2**: Manager notification + SMS alerts
3. **Level 3**: Executive notification + emergency conference call

## Integration with Cost Control Protocol

This document works in conjunction with `cost-control-protocol.md` to provide:

1. **Technical Implementation** of cost control measures
2. **Automated Enforcement** of budget limits
3. **Real-time Monitoring** capabilities
4. **Emergency Response** procedures
5. **Incident Management** workflows

## Maintenance and Updates

### Monthly Review Checklist
- [ ] Review and update cost thresholds
- [ ] Test emergency shutdown procedures
- [ ] Update contact information
- [ ] Review incident reports
- [ ] Update monitoring dashboards
- [ ] Test backup and recovery procedures

### Quarterly Improvements
- [ ] Analyze cost trends and adjust limits
- [ ] Improve monitoring coverage
- [ ] Update emergency procedures
- [ ] Team training on new procedures
- [ ] Review and update documentation

---

**Last Updated**: $(date)
**Document Version**: 1.0
**Next Review**: $(date -d "+1 month")