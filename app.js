const TEXT_TO_MORSE = Object.freeze({
  A: ".-",
  B: "-...",
  C: "-.-.",
  D: "-..",
  E: ".",
  F: "..-.",
  G: "--.",
  H: "....",
  I: "..",
  J: ".---",
  K: "-.-",
  L: ".-..",
  M: "--",
  N: "-.",
  O: "---",
  P: ".--.",
  Q: "--.-",
  R: ".-.",
  S: "...",
  T: "-",
  U: "..-",
  V: "...-",
  W: ".--",
  X: "-..-",
  Y: "-.--",
  Z: "--..",
  0: "-----",
  1: ".----",
  2: "..---",
  3: "...--",
  4: "....-",
  5: ".....",
  6: "-....",
  7: "--...",
  8: "---..",
  9: "----.",
  ".": ".-.-.-",
  ",": "--..--",
  "?": "..--..",
  "!": "-.-.--",
  "/": "-..-.",
  "-": "-....-",
  "@": ".--.-.",
  ":": "---...",
  ";": "-.-.-.",
  "=": "-...-",
  "+": ".-.-.",
  "(": "-.--.",
  ")": "-.--.-",
  "'": ".----.",
  "\"": ".-..-.",
  "&": ".-...",
  _: "..--.-"
});

const MORSE_TO_TEXT = Object.freeze(
  Object.entries(TEXT_TO_MORSE).reduce((acc, [char, code]) => {
    acc[code] = char;
    return acc;
  }, {})
);

const LEARN_STORAGE_KEY = "morse_learn_checklist_v1";

function normalizeText(input) {
  return input.toUpperCase().replace(/\s+/g, " ").trim();
}

function normalizeMorse(input) {
  return input
    .replace(/\r\n?/g, "\n")
    .replace(/\n+/g, " / ")
    .replace(/\s*\/\s*/g, " / ")
    .replace(/[ \t]+/g, " ")
    .trim();
}

function textToMorse(input) {
  const normalized = normalizeText(input);
  if (!normalized) {
    return { output: "", skipped: 0 };
  }

  const outputParts = [];
  let skipped = 0;

  for (const char of normalized) {
    if (char === " ") {
      outputParts.push("/");
      continue;
    }

    const morse = TEXT_TO_MORSE[char];
    if (morse) {
      outputParts.push(morse);
    } else {
      skipped += 1;
    }
  }

  return { output: outputParts.join(" "), skipped };
}

function morseToText(input) {
  const normalized = normalizeMorse(input);
  if (!normalized) {
    return { output: "", skipped: 0 };
  }

  const words = normalized.split(/\s*\/\s*/);
  const decodedWords = [];
  let skipped = 0;

  for (const word of words) {
    if (!word) {
      continue;
    }

    const chunks = word.split(/\s+/).filter(Boolean);
    const letters = [];

    for (const chunk of chunks) {
      if (!/^[.-]+$/.test(chunk)) {
        skipped += 1;
        continue;
      }

      const decoded = MORSE_TO_TEXT[chunk];
      if (decoded) {
        letters.push(decoded);
      } else {
        skipped += 1;
      }
    }

    decodedWords.push(letters.join(""));
  }

  return { output: decodedWords.join(" ").trim(), skipped };
}

function debounce(func, delayMs) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => func(...args), delayMs);
  };
}

async function copyText(value) {
  if (!value) {
    return false;
  }

  if (navigator.clipboard && window.isSecureContext) {
    await navigator.clipboard.writeText(value);
    return true;
  }

  const fallback = document.createElement("textarea");
  fallback.value = value;
  fallback.setAttribute("readonly", "");
  fallback.style.position = "absolute";
  fallback.style.left = "-9999px";
  document.body.appendChild(fallback);
  fallback.select();
  const ok = document.execCommand("copy");
  document.body.removeChild(fallback);
  return ok;
}

function getConverterElements() {
  return {
    textInput: document.getElementById("text-input"),
    morseInput: document.getElementById("morse-input")
  };
}

function setConverterText(text) {
  const { textInput } = getConverterElements();
  if (!textInput) {
    return;
  }

  textInput.value = text;
  textInput.dispatchEvent(new Event("input", { bubbles: true }));
}

function setConverterMorse(morse) {
  const { morseInput } = getConverterElements();
  if (!morseInput) {
    return;
  }

  morseInput.value = morse;
  morseInput.dispatchEvent(new Event("input", { bubbles: true }));
}

function initializeConverter() {
  const textInput = document.getElementById("text-input");
  const morseInput = document.getElementById("morse-input");
  const statusEl = document.getElementById("converter-status");
  const warningEl = document.getElementById("converter-warning");
  const copyBtn = document.getElementById("copy-output");
  const clearBtn = document.getElementById("clear-all");
  const swapBtn = document.getElementById("swap-direction");
  const textCard = document.getElementById("text-card");
  const morseCard = document.getElementById("morse-card");
  const textBadge = document.getElementById("text-source-badge");
  const morseBadge = document.getElementById("morse-source-badge");

  if (!textInput || !morseInput || !statusEl || !warningEl || !copyBtn || !clearBtn || !swapBtn) {
    return;
  }

  let lastEdited = "text";

  function updateSourceUI() {
    const textIsSource = lastEdited === "text";
    textCard.classList.toggle("is-source", textIsSource);
    morseCard.classList.toggle("is-source", !textIsSource);
    textBadge.textContent = textIsSource ? "Source" : "Output";
    morseBadge.textContent = textIsSource ? "Output" : "Source";
  }

  function setWarningMessage(message) {
    warningEl.textContent = message;
  }

  function convertNow() {
    if (lastEdited === "text") {
      const result = textToMorse(textInput.value);
      morseInput.value = result.output;
      statusEl.textContent = "Converted text to Morse.";
      setWarningMessage(
        result.skipped > 0
          ? `Skipped ${result.skipped} unsupported character(s) while converting text to Morse.`
          : ""
      );
      return;
    }

    const result = morseToText(morseInput.value);
    textInput.value = result.output;
    statusEl.textContent = "Converted Morse to text.";
    setWarningMessage(
      result.skipped > 0
        ? `Skipped ${result.skipped} unsupported Morse chunk(s) while decoding.`
        : ""
    );
  }

  const convertDebounced = debounce(convertNow, 120);

  textInput.addEventListener("input", () => {
    lastEdited = "text";
    updateSourceUI();
    convertDebounced();
  });

  morseInput.addEventListener("input", () => {
    lastEdited = "morse";
    updateSourceUI();
    convertDebounced();
  });

  copyBtn.addEventListener("click", async () => {
    const output = lastEdited === "text" ? morseInput.value : textInput.value;
    if (!output) {
      statusEl.textContent = "No output to copy.";
      return;
    }

    try {
      const copied = await copyText(output);
      statusEl.textContent = copied ? "Output copied to clipboard." : "Copy failed. Try manual copy.";
    } catch (error) {
      statusEl.textContent = "Copy failed. Try manual copy.";
    }
  });

  clearBtn.addEventListener("click", () => {
    textInput.value = "";
    morseInput.value = "";
    statusEl.textContent = "Cleared both fields.";
    setWarningMessage("");
  });

  swapBtn.addEventListener("click", () => {
    lastEdited = lastEdited === "text" ? "morse" : "text";
    updateSourceUI();
    convertNow();
    statusEl.textContent = "Swapped conversion direction.";
  });

  updateSourceUI();
  convertNow();
}

function initializePresetButtons() {
  const textButtons = document.querySelectorAll("[data-fill-text]");
  textButtons.forEach((button) => {
    button.addEventListener("click", () => {
      setConverterText(button.getAttribute("data-fill-text") || "");
    });
  });

  const morseButtons = document.querySelectorAll("[data-fill-morse]");
  morseButtons.forEach((button) => {
    button.addEventListener("click", () => {
      setConverterMorse(button.getAttribute("data-fill-morse") || "");
    });
  });
}

function initializeBatchLineConverter() {
  const inputEl = document.getElementById("batch-lines-input");
  const runBtn = document.getElementById("batch-lines-run");
  const clearBtn = document.getElementById("batch-lines-clear");
  const outputEl = document.getElementById("batch-lines-output");

  if (!inputEl || !runBtn || !clearBtn || !outputEl) {
    return;
  }

  runBtn.addEventListener("click", () => {
    const lines = inputEl.value.split(/\r?\n/).filter((line) => line.trim().length > 0);
    if (lines.length === 0) {
      outputEl.textContent = "Add at least one line.";
      return;
    }

    const converted = lines.map((line) => {
      const result = textToMorse(line);
      return `${line} => ${result.output || "(empty)"}`;
    });
    outputEl.textContent = converted.join("\n");
  });

  clearBtn.addEventListener("click", () => {
    inputEl.value = "";
    outputEl.textContent = "";
  });
}

function initializeAlphabetLookup() {
  const charInput = document.getElementById("alpha-char-input");
  const charBtn = document.getElementById("alpha-char-run");
  const charOutput = document.getElementById("alpha-char-output");
  const morseInput = document.getElementById("alpha-morse-input");
  const morseBtn = document.getElementById("alpha-morse-run");
  const morseOutput = document.getElementById("alpha-morse-output");

  if (!charInput || !charBtn || !charOutput || !morseInput || !morseBtn || !morseOutput) {
    return;
  }

  charBtn.addEventListener("click", () => {
    const char = normalizeText(charInput.value).charAt(0);
    if (!char) {
      charOutput.textContent = "Enter a character.";
      return;
    }
    const morse = TEXT_TO_MORSE[char];
    charOutput.textContent = morse ? `${char} = ${morse}` : "Character not supported.";
  });

  morseBtn.addEventListener("click", () => {
    const morse = normalizeMorse(morseInput.value).replace(/\s+/g, "");
    if (!morse) {
      morseOutput.textContent = "Enter Morse symbols.";
      return;
    }
    const decoded = MORSE_TO_TEXT[morse];
    morseOutput.textContent = decoded ? `${morse} = ${decoded}` : "Symbol not recognized.";
  });
}

function initializeChartLookup() {
  const queryInput = document.getElementById("chart-query-input");
  const runBtn = document.getElementById("chart-query-run");
  const output = document.getElementById("chart-query-output");
  if (!queryInput || !runBtn || !output) {
    return;
  }

  runBtn.addEventListener("click", () => {
    const raw = queryInput.value.trim();
    if (!raw) {
      output.textContent = "Enter a letter, number, or Morse symbol.";
      return;
    }

    if (/^[.\-\s/]+$/.test(raw)) {
      const normalized = normalizeMorse(raw).replace(/\s+/g, "");
      output.textContent = MORSE_TO_TEXT[normalized]
        ? `${normalized} = ${MORSE_TO_TEXT[normalized]}`
        : "No match found in chart.";
      return;
    }

    const key = normalizeText(raw).charAt(0);
    output.textContent = TEXT_TO_MORSE[key] ? `${key} = ${TEXT_TO_MORSE[key]}` : "No match found in chart.";
  });
}

function initializeNumberDrill() {
  const generateBtn = document.getElementById("number-drill-generate");
  const targetEl = document.getElementById("number-drill-target");
  const answerEl = document.getElementById("number-drill-answer");
  const checkBtn = document.getElementById("number-drill-check");
  const feedbackEl = document.getElementById("number-drill-feedback");

  if (!generateBtn || !targetEl || !answerEl || !checkBtn || !feedbackEl) {
    return;
  }

  function makeTarget() {
    return String(Math.floor(10000 + Math.random() * 90000));
  }

  generateBtn.addEventListener("click", () => {
    const target = makeTarget();
    targetEl.textContent = target;
    targetEl.setAttribute("data-target", target);
    answerEl.value = "";
    feedbackEl.textContent = "Now write the Morse result and check it.";
  });

  checkBtn.addEventListener("click", () => {
    const target = targetEl.getAttribute("data-target");
    if (!target) {
      feedbackEl.textContent = "Generate a number first.";
      return;
    }

    const expected = textToMorse(target).output;
    const actual = normalizeMorse(answerEl.value);
    feedbackEl.textContent =
      actual === expected ? "Great, correct." : `Not yet. Expected: ${expected}`;
  });
}

function initializeSosBuilder() {
  const randomBtn = document.getElementById("sos-random-call");
  const statusEl = document.getElementById("sos-builder-status");
  if (!randomBtn || !statusEl) {
    return;
  }

  const calls = ["NEED HELP NOW", "EMERGENCY AT SEA", "SOS SEND HELP", "DISTRESS SIGNAL ACTIVE"];

  randomBtn.addEventListener("click", () => {
    const text = calls[Math.floor(Math.random() * calls.length)];
    setConverterText(text);
    statusEl.textContent = `Loaded phrase: ${text}`;
  });
}

function initializeLoveBuilder() {
  const customInput = document.getElementById("love-custom-text");
  const applyBtn = document.getElementById("love-apply-custom");
  const statusEl = document.getElementById("love-builder-status");

  if (!customInput || !applyBtn || !statusEl) {
    return;
  }

  applyBtn.addEventListener("click", () => {
    const text = normalizeText(customInput.value);
    if (!text) {
      statusEl.textContent = "Enter a phrase first.";
      return;
    }
    setConverterText(text);
    statusEl.textContent = `Loaded phrase: ${text}`;
  });
}

function initializeReadQuiz() {
  const startBtn = document.getElementById("read-quiz-start");
  const codeEl = document.getElementById("read-quiz-code");
  const answerEl = document.getElementById("read-quiz-answer");
  const checkBtn = document.getElementById("read-quiz-check");
  const feedbackEl = document.getElementById("read-quiz-feedback");

  if (!startBtn || !codeEl || !answerEl || !checkBtn || !feedbackEl) {
    return;
  }

  const bank = ["HELLO", "READY", "MORSE", "SIGNAL", "PRACTICE", "LEARN"];

  startBtn.addEventListener("click", () => {
    const word = bank[Math.floor(Math.random() * bank.length)];
    codeEl.textContent = textToMorse(word).output;
    codeEl.setAttribute("data-answer", word);
    answerEl.value = "";
    feedbackEl.textContent = "Type decoded text and check.";
  });

  checkBtn.addEventListener("click", () => {
    const expected = codeEl.getAttribute("data-answer");
    if (!expected) {
      feedbackEl.textContent = "Start a quiz first.";
      return;
    }
    const answer = normalizeText(answerEl.value);
    feedbackEl.textContent = answer === expected ? "Correct." : `Try again. Expected: ${expected}`;
  });
}

function initializeLearningChecklist() {
  const checklist = document.querySelectorAll("[data-learn-task]");
  const progress = document.getElementById("learn-progress");
  if (!checklist.length || !progress) {
    return;
  }

  let saved = {};
  try {
    saved = JSON.parse(localStorage.getItem(LEARN_STORAGE_KEY) || "{}");
  } catch (error) {
    saved = {};
  }

  checklist.forEach((item) => {
    const task = item.getAttribute("data-learn-task");
    item.checked = Boolean(saved[task]);
    item.addEventListener("change", () => {
      saved[task] = item.checked;
      localStorage.setItem(LEARN_STORAGE_KEY, JSON.stringify(saved));
      updateProgress();
    });
  });

  function updateProgress() {
    const total = checklist.length;
    const done = Array.from(checklist).filter((item) => item.checked).length;
    progress.textContent = `Progress: ${done}/${total} tasks done`;
  }

  updateProgress();
}

function initializeTimingCalculator() {
  const wpmInput = document.getElementById("timing-wpm");
  const dotEl = document.getElementById("timing-dot");
  const dashEl = document.getElementById("timing-dash");
  const letterGapEl = document.getElementById("timing-letter-gap");
  const wordGapEl = document.getElementById("timing-word-gap");

  if (!wpmInput || !dotEl || !dashEl || !letterGapEl || !wordGapEl) {
    return;
  }

  function updateTiming() {
    const wpm = Math.max(5, Number(wpmInput.value) || 20);
    const dot = 1200 / wpm;
    dotEl.textContent = `${dot.toFixed(0)} ms`;
    dashEl.textContent = `${(dot * 3).toFixed(0)} ms`;
    letterGapEl.textContent = `${(dot * 3).toFixed(0)} ms`;
    wordGapEl.textContent = `${(dot * 7).toFixed(0)} ms`;
  }

  wpmInput.addEventListener("input", updateTiming);
  updateTiming();
}

function sanitizeImageMorse(raw) {
  return raw
    .replace(/[•·]/g, ".")
    .replace(/[–—−]/g, "-")
    .replace(/[|]/g, " / ")
    .replace(/[^.\-\/\s\n]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function initializeImageDecoder() {
  const rawInput = document.getElementById("image-raw-input");
  const cleanBtn = document.getElementById("image-clean-btn");
  const decodeBtn = document.getElementById("image-decode-btn");
  const fillBtn = document.getElementById("image-fill-converter");
  const cleanOutput = document.getElementById("image-clean-output");
  const decodeOutput = document.getElementById("image-decode-output");

  if (!rawInput || !cleanBtn || !decodeBtn || !fillBtn || !cleanOutput || !decodeOutput) {
    return;
  }

  function getCleaned() {
    const cleaned = sanitizeImageMorse(rawInput.value);
    cleanOutput.textContent = cleaned || "(empty)";
    return cleaned;
  }

  cleanBtn.addEventListener("click", () => {
    getCleaned();
  });

  decodeBtn.addEventListener("click", () => {
    const cleaned = getCleaned();
    if (!cleaned || cleaned === "(empty)") {
      decodeOutput.textContent = "Nothing to decode.";
      return;
    }
    decodeOutput.textContent = morseToText(cleaned).output || "(no decoded text)";
  });

  fillBtn.addEventListener("click", () => {
    const cleaned = getCleaned();
    if (!cleaned || cleaned === "(empty)") {
      return;
    }
    setConverterMorse(cleaned);
  });
}

function initializeAudioTrainer() {
  const textInput = document.getElementById("audio-trainer-text");
  const wpmInput = document.getElementById("audio-wpm");
  const wpmLabel = document.getElementById("audio-wpm-label");
  const playBtn = document.getElementById("audio-play-btn");
  const stopBtn = document.getElementById("audio-stop-btn");
  const statusEl = document.getElementById("audio-status");

  if (!textInput || !wpmInput || !wpmLabel || !playBtn || !stopBtn || !statusEl) {
    return;
  }

  const state = {
    stopped: false,
    activeContext: null
  };

  function sleep(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  async function beep(ctx, durationMs) {
    const osc = ctx.createOscillator();
    const gain = ctx.createGain();
    osc.type = "sine";
    osc.frequency.value = 650;
    gain.gain.value = 0.14;
    osc.connect(gain);
    gain.connect(ctx.destination);
    osc.start();
    await sleep(durationMs);
    osc.stop();
  }

  async function playSequence(morseTokens, dotMs) {
    if (!state.activeContext) {
      state.activeContext = new (window.AudioContext || window.webkitAudioContext)();
    }
    if (state.activeContext.state === "suspended") {
      await state.activeContext.resume();
    }

    for (let i = 0; i < morseTokens.length; i += 1) {
      if (state.stopped) {
        return;
      }

      const token = morseTokens[i];
      if (token === "/") {
        await sleep(dotMs * 7);
        continue;
      }

      for (let s = 0; s < token.length; s += 1) {
        if (state.stopped) {
          return;
        }

        const symbol = token[s];
        await beep(state.activeContext, symbol === "-" ? dotMs * 3 : dotMs);
        if (s < token.length - 1) {
          await sleep(dotMs);
        }
      }

      const nextToken = morseTokens[i + 1];
      if (nextToken && nextToken !== "/") {
        await sleep(dotMs * 3);
      }
    }
  }

  function updateWpmLabel() {
    wpmLabel.textContent = `${wpmInput.value} WPM`;
  }

  wpmInput.addEventListener("input", updateWpmLabel);
  updateWpmLabel();

  playBtn.addEventListener("click", async () => {
    const normalized = normalizeText(textInput.value || "");
    if (!normalized) {
      statusEl.textContent = "Enter text to play.";
      return;
    }

    const morse = textToMorse(normalized).output;
    const tokens = morse.split(/\s+/).filter(Boolean);
    const dotMs = (1200 / Math.max(5, Number(wpmInput.value) || 20));

    state.stopped = false;
    playBtn.disabled = true;
    statusEl.textContent = `Playing: ${morse}`;

    try {
      await playSequence(tokens, dotMs);
      statusEl.textContent = state.stopped ? "Playback stopped." : "Playback finished.";
    } catch (error) {
      statusEl.textContent = "Audio playback error.";
    } finally {
      playBtn.disabled = false;
    }
  });

  stopBtn.addEventListener("click", () => {
    state.stopped = true;
    statusEl.textContent = "Stopping...";
  });
}

function initializePageTools() {
  initializePresetButtons();
  initializeBatchLineConverter();
  initializeAlphabetLookup();
  initializeChartLookup();
  initializeNumberDrill();
  initializeSosBuilder();
  initializeLoveBuilder();
  initializeReadQuiz();
  initializeLearningChecklist();
  initializeTimingCalculator();
  initializeImageDecoder();
  initializeAudioTrainer();
}

const publicApiTarget = typeof window !== "undefined" ? window : globalThis;
publicApiTarget.normalizeText = normalizeText;
publicApiTarget.normalizeMorse = normalizeMorse;
publicApiTarget.textToMorse = textToMorse;
publicApiTarget.morseToText = morseToText;

if (typeof document !== "undefined") {
  document.addEventListener("DOMContentLoaded", () => {
    initializeConverter();
    initializePageTools();
  });
}
