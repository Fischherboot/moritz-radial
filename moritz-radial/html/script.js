let currentIndex = 1;
let slots = [];
let isOpen = false;

const overlay = document.getElementById('overlay');
const radialBg = document.getElementById('radial-background');
const highlight = document.getElementById('selection-overlay');
const labelsContainer = document.getElementById('labels-container');

function setVisible(visible) {
    isOpen = visible;
    overlay.style.display = visible ? 'flex' : 'none';
}

function buildLabels() {
    labelsContainer.innerHTML = "";

    const step = 360 / 16;
    const radius = 38; // Abstand von Mitte in %

    for (let i = 0; i < 16; i++) {
        const slot = slots[i] || { label: "", enabled: false };

        const idx = i;
        const midAngle = (idx + 0.5) * step - 90; // 0° = oben
        const rad = midAngle * Math.PI / 180;

        const x = 50 + Math.cos(rad) * radius;
        const y = 50 + Math.sin(rad) * radius;

        const label = document.createElement('div');
        label.classList.add('slice-label');
        if (!slot.enabled) label.classList.add('disabled');

        // wir speichern den Index am Element
        label.dataset.index = (i + 1).toString();

        label.style.left = x + '%';
        label.style.top = y + '%';

        const span = document.createElement('span');
        span.textContent = slot.label || "";
        label.appendChild(span);

        labelsContainer.appendChild(label);
    }
}

/* Farben für Kuchen */
function updateGradient() {
    const enabledColor = 'rgba(255, 0, 255, 0.6)';    // pink-lila
    const disabledColor = 'rgba(150, 150, 150, 0.4)'; // grau

    let parts = [];
    const step = 360 / 16;

    for (let i = 0; i < 16; i++) {
        const from = i * step;
        const to = (i + 1) * step;
        const slot = slots[i] || { enabled: false };

        const col = slot.enabled ? enabledColor : disabledColor;
        parts.push(`${col} ${from}deg ${to}deg`);
    }

    radialBg.style.background = `conic-gradient(${parts.join(',')})`;
}

/* Weißer Slice als Auswahl */
function updateHighlight() {
    const step = 360 / 16;
    let parts = [];

    for (let i = 0; i < 16; i++) {
        const from = i * step;
        const to = (i + 1) * step;

        if (i === currentIndex - 1) {
            parts.push(`rgba(255,255,255,0.9) ${from}deg ${to}deg`);
        } else {
            parts.push(`rgba(0,0,0,0) ${from}deg ${to}deg`);
        }
    }

    highlight.style.background = `conic-gradient(${parts.join(',')})`;
}

/* Text-Farbe für ausgewähltes Stück (selected-Klasse setzen) */
function updateSelectedLabel() {
    const children = labelsContainer.children;
    for (let i = 0; i < children.length; i++) {
        const el = children[i];
        const idx = parseInt(el.dataset.index || "0", 10);
        el.classList.toggle('selected', idx === currentIndex);
    }
}

function updateAll() {
    buildLabels();
    updateGradient();
    updateHighlight();
    updateSelectedLabel();
}

window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.action === 'open') {
        slots = data.slots || [];
        currentIndex = data.index || 1;
        setVisible(true);
        updateAll();
    }

    if (data.action === 'close') {
        setVisible(false);
    }

    if (data.action === 'updateIndex') {
        currentIndex = data.index || 1;
        updateHighlight();
        updateSelectedLabel();
    }
});
