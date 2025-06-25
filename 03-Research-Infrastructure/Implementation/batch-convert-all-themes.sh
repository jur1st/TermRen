#!/bin/bash

# ============================================
# BATCH CONVERSION FOR ALL THEMES
# Quick conversion of key documents to all themes
# ============================================

set -euo pipefail

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/conversion-output"

# Theme list
THEMES=("engineering" "technical" "terminal" "tron" "sneakers" "hackers" "severance")

# Documents to convert
DOCUMENTS=(
    "engineering-engagement-letter.md"
    "sample-documents/typography-test.md"
)

echo -e "${BLUE}=== Batch Conversion for All Themes ===${NC}"

# Create directories
for theme in "${THEMES[@]}"; do
    mkdir -p "$OUTPUT_DIR/docx/$theme"
    mkdir -p "$OUTPUT_DIR/html/$theme"
    mkdir -p "$OUTPUT_DIR/pdf/$theme"
done

# Convert each document with each theme
for doc in "${DOCUMENTS[@]}"; do
    if [ ! -f "$SCRIPT_DIR/$doc" ]; then
        echo -e "${YELLOW}[WARNING]${NC} Document not found: $doc"
        continue
    fi
    
    doc_basename=$(basename "$doc" .md)
    echo -e "${BLUE}[INFO]${NC} Converting: $doc_basename"
    
    for theme in "${THEMES[@]}"; do
        echo -e "  ${GREEN}→${NC} $theme theme"
        
        # Convert to Word
        pandoc "$SCRIPT_DIR/$doc" \
            -o "$OUTPUT_DIR/docx/$theme/$doc_basename.docx" \
            --toc \
            --number-sections \
            2>/dev/null || echo "    Word conversion failed"
        
        # Convert to HTML
        pandoc "$SCRIPT_DIR/$doc" \
            -o "$OUTPUT_DIR/html/$theme/$doc_basename.html" \
            --css="../../../professional-typography-system.css" \
            --toc \
            --number-sections \
            --mathjax \
            2>/dev/null || echo "    HTML conversion failed"
        
        # Convert to PDF (if possible)
        pandoc "$SCRIPT_DIR/$doc" \
            -o "$OUTPUT_DIR/pdf/$theme/$doc_basename.pdf" \
            --css="$SCRIPT_DIR/professional-typography-system.css" \
            --toc \
            --number-sections \
            2>/dev/null || echo "    PDF conversion skipped (requires additional dependencies)"
    done
done

echo -e "\n${GREEN}=== Conversion Complete ===${NC}"
echo -e "Output directory: ${YELLOW}$OUTPUT_DIR${NC}"

# Display file counts
echo -e "\n${BLUE}Generated Files Summary:${NC}"
for theme in "${THEMES[@]}"; do
    docx_count=$(find "$OUTPUT_DIR/docx/$theme" -name "*.docx" 2>/dev/null | wc -l)
    html_count=$(find "$OUTPUT_DIR/html/$theme" -name "*.html" 2>/dev/null | wc -l)
    pdf_count=$(find "$OUTPUT_DIR/pdf/$theme" -name "*.pdf" 2>/dev/null | wc -l)
    echo -e "  $theme: ${GREEN}$docx_count${NC} Word, ${GREEN}$html_count${NC} HTML, ${GREEN}$pdf_count${NC} PDF"
done

echo -e "\n${YELLOW}To view results:${NC}"
echo "  Word documents: open $OUTPUT_DIR/docx/engineering/"
echo "  HTML previews:  open $OUTPUT_DIR/html/engineering/"
echo "  All themes:     ls $OUTPUT_DIR/docx/*/"