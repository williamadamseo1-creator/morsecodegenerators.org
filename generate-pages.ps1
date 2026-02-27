$ErrorActionPreference = "Stop"

$baseNav = @'
      <nav aria-label="Site navigation">
        <a href="/">Home</a>
        <a href="/morse-code-translator/">Translator</a>
        <a href="/morse-code-alphabet/">Alphabet</a>
        <a href="/morse-code-numbers/">Numbers</a>
        <a href="/sos-in-morse-code/">SOS</a>
        <a href="/how-to-learn-morse-code/">Learn</a>
      </nav>
'@

$pages = @(
  [ordered]@{
    slug = "morse-code-translator"
    title = "Morse Code Translator | Morse to Text and Text to Morse"
    description = "Use this morse code translator online to convert text to Morse code and decode Morse to text quickly with practical examples and FAQs."
    h1 = "Morse Code Translator Online for Fast Two-Way Conversion"
    intro = "Use this guide with the live tool to translate Morse code to English and convert plain text into Morse code in seconds."
    primary = "morse code translator"
    secondary = @("translate morse code", "morse code to text", "text to morse code", "morse code translator to text")
    intent = "translator"
    tier = "P1"
    steps = @(
      "Enter your phrase in the converter below.",
      "Use one space between Morse letters and slash between words.",
      "Copy output and reverse-convert once to validate accuracy."
    )
    examples = @(
      "HELLO = .... . .-.. .-.. ---",
      "SOS = ... --- ...",
      "MORSE CODE = -- --- .-. ... . / -.-. --- -.. .",
      ".... .. = HI",
      ".-.. --- ...- . = LOVE",
      "--. --- --- -.. / .-.. ..- -.-. -.- = GOOD LUCK"
    )
    mistakes = @(
      "Mixing letter spaces with word separators.",
      "Adding unsupported symbols in Morse input.",
      "Forgetting that slash means a new word."
    )
    faqs = @(
      [ordered]@{ q = "Is this a free morse code translator online?"; a = "Yes. The translator runs in your browser at no cost." },
      [ordered]@{ q = "Can I translate morse code to English and back?"; a = "Yes. Type in either box and the direction updates automatically." },
      [ordered]@{ q = "What separator format should I use?"; a = "Use one space for letters and slash for words." },
      [ordered]@{ q = "I searched morse code translater or convertor. Is this the same tool?"; a = "Yes. Those are common misspellings of translator intent." }
    )
  },
  [ordered]@{
    slug = "morse-code-alphabet"
    title = "Morse Code Alphabet | Letters and Symbols Reference"
    description = "Learn the full Morse code alphabet with letters, numbers, and punctuation. Use examples and conversion tips for faster reading."
    h1 = "Morse Code Alphabet Guide for Letters, Numbers, and Symbols"
    intro = "This page helps you memorize the Morse code alphabet with practical reading patterns and conversion examples."
    primary = "morse code alphabet"
    secondary = @("morse code letters", "international morse code", "morse code chart", "letters to morse code")
    intent = "reference"
    tier = "P1"
    steps = @(
      "Start with frequent letters first: E, T, A, N, I, M.",
      "Practice short words before longer sentences.",
      "Use the live converter below to confirm each letter."
    )
    examples = @("A = .-", "B = -...", "C = -.-.", "S = ...", "T = -", "Z = --..", "MORSE = -- --- .-. ... .")
    mistakes = @(
      "Trying to memorize all symbols in one session.",
      "Ignoring rhythm while learning patterns.",
      "Skipping reverse decoding drills."
    )
    faqs = @(
      [ordered]@{ q = "Is this based on International Morse code?"; a = "Yes. This guide follows international Morse patterns used widely today." },
      [ordered]@{ q = "Should I learn letters before numbers?"; a = "Yes. Letters appear more often and improve early confidence." },
      [ordered]@{ q = "Can I use this with the converter tool?"; a = "Yes. Test each symbol instantly using the tool section." },
      [ordered]@{ q = "Are punctuation marks included?"; a = "Yes. Common punctuation is supported by the converter." }
    )
  },
  [ordered]@{
    slug = "morse-code-chart"
    title = "Morse Code Chart | Letter, Number, and Symbol Guide"
    description = "Use this Morse code chart to quickly reference letters, numbers, and punctuation. Great for beginners and classroom practice."
    h1 = "Morse Code Chart for Quick Lookup and Practice"
    intro = "Use this chart-style guide when you need fast symbol lookup during study, games, or puzzle solving."
    primary = "morse code chart"
    secondary = @("morse code sheet", "morse code key", "morse code alphabet chart", "numbers in morse code")
    intent = "reference"
    tier = "P1"
    steps = @(
      "Scan symbols by pattern length to improve recognition speed.",
      "Break long words into smaller chunks.",
      "Validate output in the converter below."
    )
    examples = @(
      "CHART = -.-. .... .- .-. -",
      "KEY = -.- . -.--",
      "SHEET = ... .... . . -",
      "DOT = -.. --- -",
      "DASH = -.. .- ... ...."
    )
    mistakes = @(
      "Reading too fast without checking separators.",
      "Confusing visually similar patterns like B and 6.",
      "Using inconsistent spacing."
    )
    faqs = @(
      [ordered]@{ q = "Is this chart useful for beginners?"; a = "Yes. It is optimized for quick lookup while learning." },
      [ordered]@{ q = "Can I print this page?"; a = "Yes. The sections are print-friendly for study sheets." },
      [ordered]@{ q = "Does the chart include numbers?"; a = "Yes. Number patterns are covered in examples and related pages." },
      [ordered]@{ q = "What is a good chart practice method?"; a = "Encode ten words, decode ten words, and compare results daily." }
    )
  },
  [ordered]@{
    slug = "morse-code-numbers"
    title = "Morse Code Numbers | Number Translator and Quick Reference"
    description = "Learn Morse code numbers 0-9 with examples and conversion tips. Translate number strings accurately using the live tool."
    h1 = "Morse Code Numbers: 0 to 9 with Easy Examples"
    intro = "This number-focused guide helps you translate digits correctly and avoid common sequence mistakes."
    primary = "morse code numbers"
    secondary = @("number morse code", "morse code number translator", "numbers in morse code", "number morse code translator")
    intent = "reference"
    tier = "P1"
    steps = @(
      "Memorize 1-5 patterns first.",
      "Practice reverse patterns from 6 to 0.",
      "Translate grouped numbers in the converter below."
    )
    examples = @("1 = .----", "2 = ..---", "3 = ...--", "4 = ....-", "5 = .....", "6 = -....", "7 = --...", "8 = ---..", "9 = ----.", "0 = -----")
    mistakes = @(
      "Swapping 6 and B because both start with dash.",
      "Dropping one dot in longer number patterns.",
      "Mixing number and word spacing."
    )
    faqs = @(
      [ordered]@{ q = "How do I write a phone number in Morse code?"; a = "Convert each digit individually and keep spaces between symbols." },
      [ordered]@{ q = "Is 0 the longest dash-only code?"; a = "Yes. Zero is represented by five dashes." },
      [ordered]@{ q = "Can I mix numbers and words in one message?"; a = "Yes, with normal letter spacing and slash between words." },
      [ordered]@{ q = "Which query usually matches this page?"; a = "Users often search number morse code translator or morse code numbers." }
    )
  },
  [ordered]@{
    slug = "sos-in-morse-code"
    title = "SOS in Morse Code | Meaning, Pattern, and Usage"
    description = "Learn SOS in Morse code, what it means, and how to write it correctly as ... --- ... with practical examples."
    h1 = "SOS in Morse Code: ... --- ... Explained"
    intro = "SOS is the most recognized Morse distress pattern. This guide explains the exact sequence and its usage."
    primary = "sos in morse code"
    secondary = @("sos morse code", "morse code sos", "what is sos in morse code", "...---... morse code")
    intent = "phrase"
    tier = "P1"
    steps = @(
      "Remember SOS as three dots, three dashes, three dots.",
      "Keep the sequence continuous for emergency signaling.",
      "Practice longer SOS phrases in the converter section."
    )
    examples = @("SOS = ... --- ...", "NEED SOS = -. . . -.. / ... --- ...", "SEND SOS NOW = ... . -. -.. / ... --- ... / -. --- .--", "...---... = SOS")
    mistakes = @(
      "Adding spaces inside the core SOS sequence.",
      "Placing slash separators in the middle of SOS.",
      "Confusing SOS with random three-letter patterns."
    )
    faqs = @(
      [ordered]@{ q = "What is SOS in Morse code?"; a = "SOS is ... --- ... and is globally recognized as a distress signal." },
      [ordered]@{ q = "Should SOS include slashes?"; a = "No. The core sequence does not require slashes." },
      [ordered]@{ q = "Is SOS still relevant today?"; a = "Yes. It is still taught in emergency and communication basics." },
      [ordered]@{ q = "Can I convert longer SOS messages?"; a = "Yes. Combine SOS with normal text in the converter." }
    )
  },
  [ordered]@{
    slug = "i-love-you-in-morse-code"
    title = "I Love You in Morse Code | Write and Translate the Phrase"
    description = "See how to write I love you in Morse code and practice variations like hi and hello with clean spacing rules."
    h1 = "How to Write I Love You in Morse Code"
    intro = "This phrase guide helps you encode and decode I love you in Morse code with proper spacing."
    primary = "i love you in morse code"
    secondary = @("i love you morse code", "morse code for i love you", "words in morse code", "hello in morse code")
    intent = "phrase"
    tier = "P1"
    steps = @(
      "Split your phrase into words first.",
      "Encode each letter with single spaces.",
      "Use slash between words and reverse-check output."
    )
    examples = @("I LOVE YOU = .. / .-.. --- ...- . / -.-- --- ..-", "HELLO = .... . .-.. .-.. ---", "HI = .... ..", "YES = -.-- . ...", "LOVE = .-.. --- ...- .")
    mistakes = @(
      "Missing slash separators between words.",
      "Dropping dots in longer words like LOVE.",
      "Using inconsistent spacing."
    )
    faqs = @(
      [ordered]@{ q = "What is I LOVE YOU in Morse code?"; a = ".. / .-.. --- ...- . / -.-- --- ..-" },
      [ordered]@{ q = "Can I encode romantic phrases safely?"; a = "Yes. Keep spacing clean and verify by decoding back." },
      [ordered]@{ q = "Does case matter for phrase conversion?"; a = "No. Text is normalized to uppercase automatically." },
      [ordered]@{ q = "Can I use this page for hello and hi too?"; a = "Yes. Common phrase examples are included for quick practice." }
    )
  },
  [ordered]@{
    slug = "how-to-read-morse-code"
    title = "How to Read Morse Code | Beginner Reading Method"
    description = "Learn how to read Morse code with step-by-step rhythm training, pattern recognition, and decoding practice examples."
    h1 = "How to Read Morse Code: A Beginner Method That Works"
    intro = "Reading Morse becomes easier when you train rhythm first, then pattern recognition, then words."
    primary = "how to read morse code"
    secondary = @("how to write in morse code", "decode morse code", "morse code to english", "translate morse code to english")
    intent = "learning"
    tier = "P1"
    steps = @(
      "Start with short symbols: E, T, A, N.",
      "Practice two-letter and three-letter words.",
      "Decode one short sentence daily with the converter."
    )
    examples = @(". = E", "- = T", ".- = A", "-. = N", "... = S", "-- = M", ".--. .-. .- -.-. - .. -.-. . = PRACTICE")
    mistakes = @(
      "Trying full paragraphs too early.",
      "Ignoring timing and rhythm cues.",
      "Skipping validation after decoding."
    )
    faqs = @(
      [ordered]@{ q = "How long does it take to read Morse code?"; a = "Many beginners gain basic reading ability in 2-4 weeks with daily practice." },
      [ordered]@{ q = "Should I decode by sound or symbols?"; a = "Start with symbols, then add sound drills for speed." },
      [ordered]@{ q = "What is the fastest way to improve?"; a = "Use short daily sessions and repeat common patterns frequently." },
      [ordered]@{ q = "Can the converter help reading practice?"; a = "Yes. Decode small chunks and compare expected text instantly." }
    )
  },
  [ordered]@{
    slug = "how-to-learn-morse-code"
    title = "How to Learn Morse Code | Training Plan for Beginners"
    description = "Follow this practical plan to learn Morse code with daily drills, memory strategy, and conversion exercises."
    h1 = "How to Learn Morse Code with a Practical Daily Plan"
    intro = "Use this training framework to build consistency and move from letters to full phrase decoding."
    primary = "how to learn morse code"
    secondary = @("learn morse code", "how does morse code work", "morse code meaning", "english to morse code translator")
    intent = "learning"
    tier = "P1"
    steps = @(
      "Week 1: Learn 10-12 symbols and review daily.",
      "Week 2: Add numbers and common phrases.",
      "Week 3+: Increase speed with timed conversion practice."
    )
    examples = @("Daily target: 10 words encode + decode", "Week goal: memorize core A-Z letters", "Timing drill: 5 minutes dot-dash rhythm", "Phrase drill: SOS, HELLO, NEED HELP")
    mistakes = @(
      "Skipping practice for multiple days.",
      "Learning too many symbols in one session.",
      "Only encoding without decoding."
    )
    faqs = @(
      [ordered]@{ q = "What is the best beginner schedule?"; a = "Two short sessions per day work better than one long session." },
      [ordered]@{ q = "Should I learn numbers early?"; a = "Add numbers after you are comfortable with common letters." },
      [ordered]@{ q = "How can I track progress?"; a = "Track mastered symbols, decoding speed, and weekly accuracy." },
      [ordered]@{ q = "Can this site work as a daily trainer?"; a = "Yes. Use these guides and the built-in converter together." }
    )
  },
  [ordered]@{
    slug = "how-does-morse-code-work"
    title = "How Morse Code Works | Dots, Dashes, Timing, and Decoding"
    description = "Understand how Morse code works, including timing units, spacing rules, and practical decoding flow."
    h1 = "How Morse Code Works: Timing, Spacing, and Structure"
    intro = "Morse code transforms letters and numbers into dot and dash timing patterns that can be sent visually or by sound."
    primary = "how does morse code work"
    secondary = @("what is morse code", "morse code meaning", "international morse code", "morse code encoder")
    intent = "learning"
    tier = "P1"
    steps = @(
      "Dot length = 1 unit, dash = 3 units.",
      "Gap inside a letter = 1 unit, between letters = 3 units.",
      "Word separation uses larger spacing, represented by slash in text mode."
    )
    examples = @("A = .- (dot then dash)", "S = ...", "O = ---", "SOS = ... --- ...")
    mistakes = @(
      "Using equal duration for dots and dashes.",
      "Removing letter gaps and merging symbols.",
      "Treating slash as a letter instead of a separator."
    )
    faqs = @(
      [ordered]@{ q = "Why is Morse still readable in weak signals?"; a = "Simple timing pulses survive where richer signals often fail." },
      [ordered]@{ q = "Is Morse code language-specific?"; a = "Pattern rules are standard, but mapping can vary by language set." },
      [ordered]@{ q = "Do I need audio to understand timing?"; a = "No. Start with text symbols, then add audio practice later." },
      [ordered]@{ q = "Can I test timing patterns on this site?"; a = "Yes. Use the converter and compare with known patterns like SOS." }
    )
  },
  [ordered]@{
    slug = "morse-code-translator-audio"
    title = "Morse Code Translator Audio Guide | Convert and Hear Timing"
    description = "Learn how to use Morse code translator audio workflows: convert text, listen for rhythm, and decode by timing patterns."
    h1 = "Morse Code Translator Audio: Learn Rhythm-Based Decoding"
    intro = "Audio-based Morse practice improves speed because you learn rhythm recognition instead of visual pattern only."
    primary = "morse code translator audio"
    secondary = @("morse code audio translater", "decode morse code", "english to morse", "morse code translate")
    intent = "media"
    tier = "P1"
    steps = @(
      "Convert short words using the tool below.",
      "Read symbols as short and long timing beats.",
      "Decode by rhythm and compare against expected text."
    )
    examples = @("SOS rhythm: short short short, long long long, short short short", "HI = .... ..", "HELP = .... . .-.. .--.", "READY = .-. . .- -.. -.--")
    mistakes = @(
      "Changing speed too quickly while practicing.",
      "Ignoring letter rhythm boundaries.",
      "Starting with long sentences too early."
    )
    faqs = @(
      [ordered]@{ q = "Can I practice audio without special hardware?"; a = "Yes. Basic phone or laptop audio is enough for beginners." },
      [ordered]@{ q = "What speed is good for beginners?"; a = "Start slow and increase only after maintaining high accuracy." },
      [ordered]@{ q = "Is audio better than visual training?"; a = "Use both. Visual builds memory, audio improves recognition speed." },
      [ordered]@{ q = "Does this page replace the converter?"; a = "No. This guide works best with the converter section on this page." }
    )
  },
  [ordered]@{
    slug = "morse-code-translator-picture"
    title = "Morse Code Picture Translator | Decode Morse from Images"
    description = "Use this morse code translator picture guide to decode Morse from screenshots, notes, and visual pattern references."
    h1 = "Morse Code Translator Picture: Decode Patterns from Images"
    intro = "When Morse appears in screenshots or puzzle images, transcribe symbols accurately and decode them with the tool below."
    primary = "morse code translator picture"
    secondary = @("morse code image translator", "morse code translator online", "translate morse code", "morse code trans")
    intent = "media"
    tier = "P1"
    steps = @(
      "Transcribe image symbols as dots, dashes, spaces, and slashes.",
      "Paste transcription into the Morse input field below.",
      "Verify decoded output and correct uncertain symbols."
    )
    examples = @("Image row: ... --- ... => SOS", "Image clue: .-.. --- ...- . => LOVE", "Image tag: -- . ... ... .- --. . => MESSAGE", "Image code: -. --- - . => NOTE")
    mistakes = @(
      "Confusing short dashes with dots in low-resolution images.",
      "Ignoring spacing between letters.",
      "Entering decorative symbols that are not Morse."
    )
    faqs = @(
      [ordered]@{ q = "Can I upload an image directly right now?"; a = "Current workflow is manual transcription from image to Morse symbols." },
      [ordered]@{ q = "What if the picture is blurry?"; a = "Zoom in and transcribe in small groups before decoding." },
      [ordered]@{ q = "Are puzzle clues reliable in Morse format?"; a = "Often yes, but spacing errors are common. Validate with reverse conversion." },
      [ordered]@{ q = "Can I decode from printed chart photos?"; a = "Yes. This method works for chart photos and worksheet snapshots." }
    )
  }
)

function Build-List([string[]]$items) {
  return ($items | ForEach-Object { "        <li>$_</li>" }) -join "`n"
}

function Build-Faq($items) {
  return ($items | ForEach-Object {
@"
      <details>
        <summary>$($_.q)</summary>
        <p>$($_.a)</p>
      </details>
"@
  }) -join "`n"
}

function Build-Paragraphs([string[]]$items) {
  return ($items | ForEach-Object { "      <p>$_</p>" }) -join "`n"
}

function Get-DeepDive($page) {
  switch ($page.intent) {
    "translator" {
      return @(
        "A good translator page should solve both conversion directions in one place. This page includes a live converter so users can convert text to Morse code, then decode back immediately for accuracy checks.",
        "For best results, keep spacing consistent and avoid unsupported symbols. If a symbol is skipped, the warning message shows exactly how many items were ignored."
      )
    }
    "reference" {
      return @(
        "Reference pages are designed for fast lookup. Use this guide when you need exact symbols for letters, numbers, or chart-style memorization during study sessions.",
        "Pair this page with the converter to move from static reference to active practice. Active encode/decode drills improve recall much faster than passive reading."
      )
    }
    "phrase" {
      return @(
        "Phrase-focused pages help users solve common real searches quickly. You get exact sequence examples plus spacing rules so your output remains readable.",
        "After copying a phrase result, always run reverse conversion once. This catches spacing mistakes before you share the final Morse message."
      )
    }
    "learning" {
      return @(
        "Learning intent needs structure, not only symbol lists. This page combines method, examples, and practice prompts so beginners can build skill steadily.",
        "Use short, repeatable sessions. Consistent daily practice with immediate feedback from the converter gives better retention than occasional long sessions."
      )
    }
    "media" {
      return @(
        "Media intent queries usually come from audio or image decoding tasks. This page explains practical workflows for converting non-text clues into valid Morse input.",
        "When the source is noisy or blurry, decode in small chunks first. Short chunk validation reduces error rate and speeds up final message reconstruction."
      )
    }
    default {
      return @(
        "This guide combines explanation, examples, and a live converter so you can learn and execute in one place.",
        "Use related links at the bottom to continue into deeper Morse topics without losing context."
      )
    }
  }
}

function Get-UseCases($page) {
  switch ($page.intent) {
    "translator" { return @("Fast two-way conversion for messages", "Classroom and self-study text checks", "Puzzle and CTF decoding tasks") }
    "reference" { return @("Quick letter and symbol lookup", "Worksheet and chart-based learning", "Error-checking during manual encoding") }
    "phrase" { return @("Emergency phrase validation", "Personal phrase conversion practice", "Communication drills with known sentences") }
    "learning" { return @("Beginner study plans", "Daily progressive practice", "Skill-building for reading and writing Morse") }
    "media" { return @("Decode from image clues", "Rhythm-based audio practice", "Cross-checking media-transcribed symbols") }
    default { return @("Practical conversion", "Learning support", "Quick reference") }
  }
}

function Get-PracticePrompts($page) {
  return @(
    "Convert this phrase to Morse: HELLO TEAM READY",
    "Decode this Morse: ... . . / -.-- --- ..- / ... --- --- -.",
    "Create a custom sentence, convert it, then decode back to validate."
  )
}

foreach ($p in $pages) {
  $steps = Build-List $p.steps
  $examples = Build-List $p.examples
  $mistakes = Build-List $p.mistakes
  $faqHtml = Build-Faq $p.faqs
  $secondary = ($p.secondary -join ", ")
  $deepDiveHtml = Build-Paragraphs (Get-DeepDive $p)
  $useCasesHtml = Build-List (Get-UseCases $p)
  $practiceHtml = Build-List (Get-PracticePrompts $p)

  $faqEntities = @()
  foreach ($f in $p.faqs) {
    $faqEntities += [ordered]@{
      "@type" = "Question"
      "name" = $f.q
      "acceptedAnswer" = [ordered]@{
        "@type" = "Answer"
        "text" = $f.a
      }
    }
  }

  $schema = [ordered]@{
    "@context" = "https://schema.org"
    "@graph" = @(
      [ordered]@{
        "@type" = "WebPage"
        "name" = $p.h1
        "url" = "https://morsecodegenerators.org/$($p.slug)/"
        "description" = $p.description
        "mainEntityOfPage" = "https://morsecodegenerators.org/$($p.slug)/"
      },
      [ordered]@{
        "@type" = "FAQPage"
        "mainEntity" = $faqEntities
      }
    )
  }
  $schemaJson = $schema | ConvertTo-Json -Depth 10

  $html = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$($p.title)</title>
  <meta name="description" content="$($p.description)">
  <meta name="robots" content="index,follow,max-image-preview:large">
  <link rel="canonical" href="https://morsecodegenerators.org/$($p.slug)/">
  <meta property="og:type" content="article">
  <meta property="og:title" content="$($p.h1)">
  <meta property="og:description" content="$($p.description)">
  <meta property="og:url" content="https://morsecodegenerators.org/$($p.slug)/">
  <meta property="og:image" content="https://morsecodegenerators.org/favicon.svg">
  <meta name="twitter:card" content="summary">
  <meta name="twitter:title" content="$($p.h1)">
  <meta name="twitter:description" content="$($p.description)">
  <link rel="icon" href="/favicon.svg" type="image/svg+xml">
  <link rel="stylesheet" href="/styles.css">
  <script defer src="/app.js"></script>
  <script type="application/ld+json">
$schemaJson
  </script>
</head>
<body>
  <header class="site-header">
    <div class="container nav-wrap">
      <p class="brand">Morse Code Generator</p>
$baseNav    </div>
  </header>

  <main class="container">
    <section class="hero page-hero reveal">
      <p class="eyebrow">$($p.primary) guide</p>
      <h1>$($p.h1)</h1>
      <p>$($p.intro)</p>
    </section>

    <section id="converter" class="panel reveal">
      <h2>Live Morse Converter</h2>
      <p class="panel-lead">Type in either box. The last edited input controls conversion direction automatically.</p>
      <div class="grid-two">
        <div class="field-card" id="text-card">
          <div class="field-head">
            <label for="text-input">Plain Text</label>
            <span class="source-badge" id="text-source-badge" aria-live="polite">Source</span>
          </div>
          <textarea id="text-input" rows="8" placeholder="Example: SOS NEED HELP AT DOCK 7"></textarea>
        </div>
        <div class="field-card" id="morse-card">
          <div class="field-head">
            <label for="morse-input">Morse Code</label>
            <span class="source-badge" id="morse-source-badge" aria-live="polite">Output</span>
          </div>
          <textarea id="morse-input" rows="8" placeholder="... --- ... / -. . . -.. / .... . .-.. .--."></textarea>
        </div>
      </div>
      <div class="button-row">
        <button type="button" id="copy-output">Copy Output</button>
        <button type="button" id="swap-direction" class="ghost">Swap Direction</button>
        <button type="button" id="clear-all" class="ghost">Clear All</button>
      </div>
      <p id="converter-status" class="status" aria-live="polite">Ready.</p>
      <p id="converter-warning" class="warning" aria-live="polite"></p>
    </section>

    <section class="panel reveal">
      <h2>Detailed Explanation</h2>
$deepDiveHtml
    </section>

    <section class="panel reveal">
      <h2>Who This Page Helps</h2>
      <ul class="example-list">
$useCasesHtml
      </ul>
    </section>

    <section class="panel reveal">
      <h2>How to Use This Page</h2>
      <ol>
$steps
      </ol>
    </section>

    <section class="panel reveal">
      <h2>Examples</h2>
      <ul class="example-list">
$examples
      </ul>
    </section>

    <section class="panel reveal">
      <h2>Practice Prompts</h2>
      <ul class="example-list">
$practiceHtml
      </ul>
    </section>

    <section class="panel reveal">
      <h2>Common Mistakes to Avoid</h2>
      <ul class="example-list">
$mistakes
      </ul>
    </section>

    <section id="faq" class="panel reveal">
      <h2>Frequently Asked Questions</h2>
$faqHtml
    </section>

    <section class="panel reveal">
      <h2>Related Translators and Learning Pages</h2>
      <div class="link-grid">
        <article>
          <h3>Related Translators</h3>
          <ul>
            <li><a href="/morse-code-translator/">Morse Code Translator</a></li>
            <li><a href="/morse-code-translator-audio/">Morse Code Translator Audio</a></li>
            <li><a href="/morse-code-translator-picture/">Morse Code Translator Picture</a></li>
          </ul>
        </article>
        <article>
          <h3>Related Practice Queries</h3>
          <ul>
            <li><a href="/sos-in-morse-code/">SOS in Morse Code</a></li>
            <li><a href="/i-love-you-in-morse-code/">I Love You in Morse Code</a></li>
            <li><a href="/how-to-read-morse-code/">How to Read Morse Code</a></li>
          </ul>
        </article>
        <article>
          <h3>Common Phrase and Reference Pages</h3>
          <ul>
            <li><a href="/morse-code-alphabet/">Morse Code Alphabet</a></li>
            <li><a href="/morse-code-chart/">Morse Code Chart</a></li>
            <li><a href="/morse-code-numbers/">Morse Code Numbers</a></li>
          </ul>
        </article>
      </div>
      <p class="muted">Secondary keywords covered naturally: $secondary.</p>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container footer-wrap">
      <p>Privacy note: This guide is informational. Converter input stays in your browser session.</p>
      <p>Version: v1.2.0</p>
    </div>
  </footer>
</body>
</html>
"@

  $dir = Join-Path (Get-Location) $p.slug
  if (-not (Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir | Out-Null
  }
  $file = Join-Path $dir "index.html"
  Set-Content -Path $file -Value $html -Encoding UTF8
}
