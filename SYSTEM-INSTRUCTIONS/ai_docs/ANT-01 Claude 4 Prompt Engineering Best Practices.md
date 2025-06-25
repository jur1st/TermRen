**Claude 4 Prompt Engineering Best Practices - Anthropic**
==============================================

**Authors:** [Anthropic Team](https://docs.anthropic.com/en/docs/about/team)

**URL:** https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/claude-4-best-practices

**Table of Contents**
-----------------

1. [General Principles](#general-principles)
2. [Guidance for Specific Situations](#guidance-for-specific-situations)
3. [Migration Considerations](#migration-considerations)

**General Principles**
-------------------

### Be Explicit with Your Instructions

Claude 4 models respond well to clear, explicit instructions. Being specific about your desired output can help enhance results. Customers who desire the “above and beyond” behavior from previous Claude models might need to more explicitly request these behaviors with Claude 4.

### Add Context to Improve Performance

Providing context or motivation behind your instructions, such as explaining to Claude why such behavior is important, can help Claude 4 better understand your goals and deliver more targeted responses. Claude is smart enough to generalize from the explanation.

### Be Vigilant with Examples & Details

Claude 4 models pay attention to details and examples as part of instruction following. Ensure that your examples align with the behaviors you want to encourage and minimize behaviors you want to avoid.

**Guidance for Specific Situations**
---------------------------------

### Control the Format of Responses

There are a few ways that we have found to be particularly effective in steering output formatting in Claude 4 models:

1.  **Tell Claude what to do instead of what not to do**
    
    -   Instead of: “Do not use markdown in your response”
    -   Try: “Your response should be composed of smoothly flowing prose paragraphs.”
2.  **Use XML format indicators**
    
    -   Try: “Write the prose sections of your response in <smoothly\_flowing\_prose\_paragraphs> tags.”
3.  **Match your prompt style to the desired output**
    
    The formatting style used in your prompt may influence Claude’s response style. If you are still experiencing steerability issues with output formatting, we recommend as best as you can matching your prompt style to your desired output style. For example, removing markdown from your prompt can reduce the volume of markdown in the output.

### Leverage Thinking & Interleaved Thinking Capabilities

Claude 4 offers thinking capabilities that can be especially helpful for tasks involving reflection after tool use or complex multi-step reasoning. You can guide its initial or interleaved thinking for better results.

### Optimize Parallel Tool Calling

Claude 4 models excel at parallel tool execution. They have a high success rate in using parallel tool calling without any prompting to do so, but some minor prompting can boost this behavior to ~100% parallel tool use success rate. We have found this prompt to be most effective:

### Reduce File Creation in Agentic Coding

Claude 4 models may sometimes create new files for testing and iteration purposes, particularly when working with code. This approach allows Claude to use files, especially python scripts, as a ‘temporary scratchpad’ before saving its final output. Using temporary files can improve outcomes particularly for agentic coding use cases.

If you’d prefer to minimize net new file creation, you can instruct Claude to clean up after itself:

### Enhance Visual and Frontend Code Generation

For frontend code generation, you can steer Claude 4 models to create complex, detailed, and interactive designs by providing explicit encouragement:

You can also improve Claude’s frontend performance in specific areas by providing additional modifiers and details on what to focus on:

-    “Include as many relevant features and interactions as possible”
-    “Add thoughtful details like hover states, transitions, and micro-interactions”
-    “Create an impressive demonstration showcasing web development capabilities”
-    “Apply design principles: hierarchy, contrast, balance, and movement”

**Migration Considerations**
-------------------------

When migrating from Sonnet 3.7 to Claude 4:

1.  **Be specific about desired behavior**: Consider describing exactly what you’d like to see in the output.
    
2.  **Frame your instructions with modifiers**: Adding modifiers that encourage Claude to increase the quality and detail of its output can help better shape Claude’s performance. For example, instead of “Create an analytics dashboard”, use “Create an analytics dashboard. Include as many relevant features and interactions as possible. Go beyond the basics to create a fully-featured implementation.”
    
3.  **Request specific features explicitly**: Animations and interactive elements should be requested explicitly when desired.

**Paragraph Count: 13**