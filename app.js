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

const publicApiTarget = typeof window !== "undefined" ? window : globalThis;
publicApiTarget.normalizeText = normalizeText;
publicApiTarget.normalizeMorse = normalizeMorse;
publicApiTarget.textToMorse = textToMorse;
publicApiTarget.morseToText = morseToText;

if (typeof document !== "undefined") {
  document.addEventListener("DOMContentLoaded", initializeConverter);
}
