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
      "Enter your phrase in the converter on the homepage.",
      "Use a single space between Morse letters and slash between words.",
      "Copy output and verify with the reverse direction to avoid mistakes."
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
      [ordered]@{ q = "Is this a free morse code translator online?"; a = "Yes. The translator is free and works directly in your browser." },
      [ordered]@{ q = "Can I translate morse code to English and back?"; a = "Yes. Type in either box and the tool auto-detects direction." },
      [ordered]@{ q = "What separator format should I use?"; a = "Use one space for letters and slash for words." },
      [ordered]@{ q = "I searched morse code translater or convertor. Is this the same tool?"; a = "Yes. Common misspellings like translater and convertor refer to the same translator intent." }
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
      "Start with the most common letters: E, T, A, N, I, M.",
      "Practice short words before full sentences.",
      "Use the live converter to check each letter combination."
    )
    examples = @("A = .-", "B = -...", "C = -.-.", "S = ...", "T = -", "Z = --..", "MORSE = -- --- .-. ... .")
    mistakes = @(
      "Trying to memorize all symbols at once.",
      "Ignoring timing rhythm while learning patterns.",
      "Not practicing reverse decoding."
    )
    faqs = @(
      [ordered]@{ q = "Is this based on International Morse code?"; a = "Yes, this reference follows the international standard used by most modern resources." },
      [ordered]@{ q = "Should I learn letters before numbers?"; a = "Yes. Letters appear more often in everyday messages and improve speed quickly." },
      [ordered]@{ q = "Can I use this with the converter tool?"; a = "Yes. Open the homepage converter and test each symbol instantly." },
      [ordered]@{ q = "Are punctuation marks included?"; a = "Yes. The converter supports common punctuation and slash as word separator." }
    )
  },
  [ordered]@{
    slug = "morse-code-chart"
    title = "Morse Code Chart | Letter, Number, and Symbol Guide"
    description = "Use this Morse code chart to quickly reference letters, numbers, and punctuation. Great for beginners and classroom practice."
    h1 = "Morse Code Chart for Quick Lookup and Practice"
    intro = "Use this chart-style guide when you need a fast lookup for symbols during practice, puzzles, or study sessions."
    primary = "morse code chart"
    secondary = @("morse code sheet", "morse code key", "morse code alphabet chart", "numbers in morse code")
    intent = "reference"
    tier = "P1"
    steps = @(
      "Scan letters left to right and match by pattern length.",
      "Break long words into small chunks.",
      "Verify final output in the converter."
    )
    examples = @(
      "CHART = -.-. .... .- .-. -",
      "KEY = -.- . -.--",
      "SHEET = ... .... . . -",
      "DOT = -.. --- -",
      "DASH = -.. .- ... ...."
    )
    mistakes = @(
      "Reading chart rows too fast without checking separators.",
      "Confusing similar patterns like B and 6.",
      "Using inconsistent word spacing."
    )
    faqs = @(
      [ordered]@{ q = "Is this chart useful for beginners?"; a = "Yes. It is designed for fast visual lookup while learning." },
      [ordered]@{ q = "Can I print this page?"; a = "Yes. The content is structured for easy printing and reference." },
      [ordered]@{ q = "Does the chart include numbers?"; a = "Yes. Number patterns are included with letter guidance." },
      [ordered]@{ q = "What is the best way to practice with a chart?"; a = "Pick ten words daily, encode them, then decode them back." }
    )
  },
  [ordered]@{
    slug = "morse-code-numbers"
    title = "Morse Code Numbers | Number Translator and Quick Reference"
    description = "Learn Morse code numbers 0-9 with examples and conversion tips. Translate number strings accurately using the live tool."
    h1 = "Morse Code Numbers: 0 to 9 with Easy Examples"
    intro = "This number-focused guide helps you translate digits correctly and avoid common number sequence mistakes in Morse."
    primary = "morse code numbers"
    secondary = @("number morse code", "morse code number translator", "numbers in morse code", "number morse code translator")
    intent = "reference"
    tier = "P1"
    steps = @(
      "Memorize number patterns from 1 to 5 first.",
      "Practice reverse patterns from 6 to 0.",
      "Use grouped number examples in the converter."
    )
    examples = @("1 = .----", "2 = ..---", "3 = ...--", "4 = ....-", "5 = .....", "6 = -....", "7 = --...", "8 = ---..", "9 = ----.", "0 = -----")
    mistakes = @(
      "Swapping 6 and B because both start with dash.",
      "Dropping one dot in long number patterns.",
      "Not separating numbers from words clearly."
    )
    faqs = @(
      [ordered]@{ q = "How do I write a phone number in Morse code?"; a = "Convert each digit separately and keep spaces between each number symbol." },
      [ordered]@{ q = "Is 0 the longest dash-only code?"; a = "Yes. Zero uses five dashes in international Morse." },
      [ordered]@{ q = "Can I mix numbers and words in one message?"; a = "Yes. Use normal letter spacing and slash between words." },
      [ordered]@{ q = "Which query matches this page intent?"; a = "Users often search number morse code translator or morse code number guide." }
    )
  },
  [ordered]@{
    slug = "sos-in-morse-code"
    title = "SOS in Morse Code | Meaning, Pattern, and Usage"
    description = "Learn SOS in Morse code, what it means, and how to write it correctly as ... --- ... with practical examples."
    h1 = "SOS in Morse Code: ... --- ... Explained"
    intro = "SOS is the most recognized Morse distress pattern. This guide explains the exact sequence and when it is used."
    primary = "sos in morse code"
    secondary = @("sos morse code", "morse code sos", "what is sos in morse code", "...---... morse code")
    intent = "phrase"
    tier = "P1"
    steps = @(
      "Remember SOS as three dots, three dashes, three dots.",
      "Keep the sequence continuous for emergency signaling.",
      "Use the converter to test phrase-level messages containing SOS."
    )
    examples = @(
      "SOS = ... --- ...",
      "NEED SOS = -. . . -.. / ... --- ...",
      "SEND SOS NOW = ... . -. -.. / ... --- ... / -. --- .--",
      "...---... = SOS"
    )
    mistakes = @(
      "Adding unnecessary spaces inside the SOS sequence.",
      "Mixing slash separators inside SOS.",
      "Confusing SOS with random three-letter patterns."
    )
    faqs = @(
      [ordered]@{ q = "What is SOS in Morse code?"; a = "It is ... --- ... and is internationally recognized as a distress signal." },
      [ordered]@{ q = "Should SOS include slashes?"; a = "No. The core sequence is continuous without word separators." },
      [ordered]@{ q = "Is SOS still taught today?"; a = "Yes. It remains an important emergency pattern in many training contexts." },
      [ordered]@{ q = "Can I convert longer SOS messages?"; a = "Yes. Use the homepage converter and combine SOS with normal words." }
    )
  },
  [ordered]@{
    slug = "i-love-you-in-morse-code"
    title = "I Love You in Morse Code | Write and Translate the Phrase"
    description = "See how to write I love you in Morse code and practice variations like hi and hello with clean spacing rules."
    h1 = "How to Write I Love You in Morse Code"
    intro = "This phrase guide helps you encode and decode I love you in Morse code with correct letter and word spacing."
    primary = "i love you in morse code"
    secondary = @("i love you morse code", "morse code for i love you", "words in morse code", "hello in morse code")
    intent = "phrase"
    tier = "P1"
    steps = @(
      "Split the sentence by words first.",
      "Encode each letter with single spaces.",
      "Use slash between words and verify output with reverse decoding."
    )
    examples = @(
      "I LOVE YOU = .. / .-.. --- ...- . / -.-- --- ..-",
      "HELLO = .... . .-.. .-.. ---",
      "HI = .... ..",
      "YES = -.-- . ...",
      "LOVE = .-.. --- ...- ."
    )
    mistakes = @(
      "Forgetting slash separators between words.",
      "Dropping dots in longer words like LOVE.",
      "Using mixed spacing that breaks decoding."
    )
    faqs = @(
      [ordered]@{ q = "What is I LOVE YOU in Morse code?"; a = ".. / .-.. --- ...- . / -.-- --- ..-" },
      [ordered]@{ q = "Can I encode romantic phrases safely?"; a = "Yes. Use clear spacing and recheck by decoding back." },
      [ordered]@{ q = "Does case matter for phrase conversion?"; a = "No. Text input is normalized to uppercase." },
      [ordered]@{ q = "Can I use this page for hello and hi too?"; a = "Yes. This page includes common phrase examples and links to the converter." }
    )
  },
  [ordered]@{
    slug = "how-to-read-morse-code"
    title = "How to Read Morse Code | Beginner Reading Method"
    description = "Learn how to read Morse code with step-by-step rhythm training, pattern recognition, and decoding practice examples."
    h1 = "How to Read Morse Code: A Beginner Method That Works"
    intro = "Reading Morse becomes easier when you train rhythm first, then patterns, then real words. Use this process daily."
    primary = "how to read morse code"
    secondary = @("how to write in morse code", "decode morse code", "morse code to english", "translate morse code to english")
    intent = "learning"
    tier = "P1"
    steps = @(
      "Start with short symbols: E, T, A, N.",
      "Practice two-letter and three-letter words.",
      "Decode one sentence per day in the live converter."
    )
    examples = @(
      ". = E",
      "- = T",
      ".- = A",
      "-. = N",
      "... = S",
      "-- = M",
      ".--. .-. .- -.-. - .. -.-. . = PRACTICE"
    )
    mistakes = @(
      "Trying to read full paragraphs too early.",
      "Ignoring timing and rhythm cues.",
      "Not validating decoded text after practice."
    )
    faqs = @(
      [ordered]@{ q = "How long does it take to read Morse code?"; a = "Most beginners gain basic reading ability with 2-4 weeks of consistent daily practice." },
      [ordered]@{ q = "Should I decode by sound or symbols?"; a = "Start with symbols, then add audio rhythm drills for speed." },
      [ordered]@{ q = "What is the fastest way to improve?"; a = "Use short daily sessions and review common patterns repeatedly." },
      [ordered]@{ q = "Can the homepage tool help reading practice?"; a = "Yes. Decode small chunks and compare expected text immediately." }
    )
  },
  [ordered]@{
    slug = "how-to-learn-morse-code"
    title = "How to Learn Morse Code | Training Plan for Beginners"
    description = "Follow this practical plan to learn Morse code with daily drills, memory strategy, and conversion exercises."
    h1 = "How to Learn Morse Code with a Practical Daily Plan"
    intro = "Use this beginner training framework to build consistency, improve recall, and move from letters to full sentences."
    primary = "how to learn morse code"
    secondary = @("learn morse code", "how does morse code work", "morse code meaning", "english to morse code translator")
    intent = "learning"
    tier = "P1"
    steps = @(
      "Week 1: Learn top 12 symbols and review twice daily.",
      "Week 2: Add numbers and phrase practice.",
      "Week 3+: Practice speed with timed conversion sessions."
    )
    examples = @(
      "Day practice target: 10 words encode + decode",
      "Week goal: Memorize A-Z core letters",
      "Timing drill: 5 minutes dot and dash rhythm",
      "Phrase drill: SOS, HELLO, NEED HELP"
    )
    mistakes = @(
      "Skipping reviews for several days.",
      "Learning too many symbols in one session.",
      "Ignoring decoding practice while only encoding."
    )
    faqs = @(
      [ordered]@{ q = "What is the best beginner schedule?"; a = "Two short sessions per day work better than one long weekly session." },
      [ordered]@{ q = "Should I learn numbers early?"; a = "Add numbers after you become comfortable with common letters." },
      [ordered]@{ q = "How can I track progress?"; a = "Use a checklist of symbols mastered and weekly phrase speed." },
      [ordered]@{ q = "Can this site be used as a daily trainer?"; a = "Yes. Combine this plan with the live converter and examples on related pages." }
    )
  },
  [ordered]@{
    slug = "how-does-morse-code-work"
    title = "How Morse Code Works | Dots, Dashes, Timing, and Decoding"
    description = "Understand how Morse code works, including timing units, spacing rules, and practical decoding flow."
    h1 = "How Morse Code Works: Timing, Spacing, and Structure"
    intro = "Morse code converts letters and numbers into timed dot and dash patterns. Timing rules control readability."
    primary = "how does morse code work"
    secondary = @("what is morse code", "morse code meaning", "international morse code", "morse code encoder")
    intent = "learning"
    tier = "P1"
    steps = @(
      "Dot length = 1 timing unit, dash = 3 units.",
      "Gap inside one letter = 1 unit, between letters = 3 units.",
      "Word separation uses a larger gap, represented by slash in text mode."
    )
    examples = @(
      "A = .- (dot then dash)",
      "S = ... (three dots)",
      "O = --- (three dashes)",
      "SOS = ... --- ..."
    )
    mistakes = @(
      "Using equal duration for dots and dashes.",
      "Removing letter gaps and causing merge errors.",
      "Treating slash as a letter instead of word separator."
    )
    faqs = @(
      [ordered]@{ q = "Why is Morse still readable with low bandwidth?"; a = "Because simple on-off timing patterns can pass through weak channels." },
      [ordered]@{ q = "Is Morse code language-specific?"; a = "The code pattern system is standard, but mapped text depends on language set." },
      [ordered]@{ q = "Do I need audio to understand timing?"; a = "No. You can start with text symbols and add audio later for speed." },
      [ordered]@{ q = "Can I test timing patterns here?"; a = "Yes. Use converter output and compare to known examples like SOS and HELLO." }
    )
  },
  [ordered]@{
    slug = "morse-code-translator-audio"
    title = "Morse Code Translator Audio Guide | Convert and Hear Timing"
    description = "Learn how to use Morse code translator audio workflows: convert text, listen for rhythm, and decode by timing patterns."
    h1 = "Morse Code Translator Audio: Learn Rhythm-Based Decoding"
    intro = "Audio-based Morse practice improves speed because you train timing recognition, not only visual symbol matching."
    primary = "morse code translator audio"
    secondary = @("morse code audio translater", "decode morse code", "english to morse", "morse code translate")
    intent = "media"
    tier = "P1"
    steps = @(
      "Convert a short phrase in the homepage tool.",
      "Play each symbol with consistent dot and dash timing.",
      "Decode by rhythm and compare against text output."
    )
    examples = @(
      "SOS rhythm: short short short, long long long, short short short",
      "HI = .... ..",
      "HELP = .... . .-.. .--.",
      "READY = .-. . .- -.. -.--"
    )
    mistakes = @(
      "Changing speed too quickly between attempts.",
      "Not separating letter rhythm from word rhythm.",
      "Practicing with long sentences before mastering short words."
    )
    faqs = @(
      [ordered]@{ q = "Can I practice audio without special hardware?"; a = "Yes. Basic phone or laptop audio is enough for beginner drills." },
      [ordered]@{ q = "What speed is good for beginners?"; a = "Start slow and increase only after accuracy stays high." },
      [ordered]@{ q = "Is audio better than visual training?"; a = "Use both. Visual helps memorization, audio improves real-time recognition." },
      [ordered]@{ q = "Does this page replace the converter?"; a = "No. Use this guide with the main converter for best results." }
    )
  },
  [ordered]@{
    slug = "morse-code-translator-picture"
    title = "Morse Code Picture Translator | Decode Morse from Images"
    description = "Use this morse code translator picture guide to decode Morse from screenshots, notes, and visual pattern references."
    h1 = "Morse Code Translator Picture: Decode Patterns from Images"
    intro = "When Morse appears in charts, screenshots, or puzzle images, use this method to transcribe symbols accurately."
    primary = "morse code translator picture"
    secondary = @("morse code image translator", "morse code translator online", "translate morse code", "morse code trans")
    intent = "media"
    tier = "P1"
    steps = @(
      "Transcribe image symbols exactly as dots, dashes, spaces, and slashes.",
      "Paste transcription into the converter Morse input box.",
      "Verify decoded output and correct uncertain symbols."
    )
    examples = @(
      "Image row: ... --- ... => SOS",
      "Image clue: .-.. --- ...- . => LOVE",
      "Image tag: -- . ... ... .- --. . => MESSAGE",
      "Image code: -. --- - . => NOTE"
    )
    mistakes = @(
      "Confusing small dash marks with dots in low-resolution images.",
      "Ignoring spacing between Morse letters.",
      "Entering punctuation symbols incorrectly from decorative fonts."
    )
    faqs = @(
      [ordered]@{ q = "Can I upload an image directly right now?"; a = "Current workflow is manual transcription from image to Morse symbols." },
      [ordered]@{ q = "What if the picture is blurry?"; a = "Zoom in and transcribe in small groups, then decode each group." },
      [ordered]@{ q = "Are puzzle clues reliable in Morse format?"; a = "Many are, but spacing errors are common. Validate with reverse conversion." },
      [ordered]@{ q = "Can I decode from printed chart photos?"; a = "Yes. This method works well for chart and worksheet images." }
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

foreach ($p in $pages) {
  $steps = Build-List $p.steps
  $examples = Build-List $p.examples
  $mistakes = Build-List $p.mistakes
  $faqHtml = Build-Faq $p.faqs
  $secondary = ($p.secondary -join ", ")

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
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "$($p.h1)",
    "url": "https://morsecodegenerators.org/$($p.slug)/",
    "description": "$($p.description)",
    "mainEntityOfPage": "https://morsecodegenerators.org/$($p.slug)/"
  }
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

    <section class="panel reveal">
      <h2>Use the Live Converter</h2>
      <p class="muted">Need instant conversion? Open the main tool and convert in both directions.</p>
      <a class="button-link" href="/#converter">Open Live Morse Converter</a>
      <p class="muted">Primary keyword: <strong>$($p.primary)</strong> | Intent: $($p.intent) | Priority: $($p.tier)</p>
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
      <p>Privacy note: This guide is informational. Use the homepage tool for live conversion and output copying.</p>
      <p>Version: v1.1.0</p>
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
