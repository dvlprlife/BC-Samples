document.getElementById('controlAddIn').innerHTML =`
 <div class = "app" >
   <header class = "hud" >
     <div class = "hud__block" >
       <span class = "hud__label" > Time Left:</span >
       <span id = "time-remaining" class = "hud__value" > 60 </span >
            </div>
            <div class = "hud__block" >
       <span class = "hud__label" > Score:</span >
       <span id = "score" class = "hud__value" > 0 </span >
            </div>
            <div class = "hud__block" >
       <span class = "hud__label" > Popped:</span >
       <span id = "popped" class = "hud__value" > 0 </span >
            </div>
            <div class = "hud__block" >
      <span class = "hud__label" > Missed:</span >
       <span id = "missed" class = "hud__value" > 0 </span >
            </div>
     <button id = "start-btn" class = "hud__btn" > Start Game </button >
   </ header >
   <main >
     <div id = "game-area" class = "game-area" aria-label = "Circle popping game area" role = "application" ></div>
   </ main >
 </div>
`;


const GAME_DURATION_MS = 60_000;
const SPAWN_INTERVAL_MS = 700;

const SMALL_COLOR = "#ff3b30";
const MEDIUM_COLOR = "#9b59ff";
const LARGE_COLOR = "#2e86ff";

const SMALL_LIFETIME_MS = 900;
const MEDIUM_LIFETIME_MS = 1500;
const LARGE_LIFETIME_MS = 2400;

const SMALL_SCORE_VALUE = 30;
const MEDIUM_SCORE_VALUE = 20;
const LARGE_SCORE_VALUE = 10;

const SMALL_DIAMETER = 60;
const MEDIUM_DIAMETER = 100;
const LARGE_DIAMETER = 150;
const POP_ANIMATION_DURATION_MS = 280;

const circleProfiles = [
    {
        label: "small",
        diameter: SMALL_DIAMETER,
        color: SMALL_COLOR,
        lifetime: SMALL_LIFETIME_MS,
        score: SMALL_SCORE_VALUE,
    },
    {
        label: "medium",
        diameter: MEDIUM_DIAMETER,
        color: MEDIUM_COLOR,
        lifetime: MEDIUM_LIFETIME_MS,
        score: MEDIUM_SCORE_VALUE,
    },
    {
        label: "large",
        diameter: LARGE_DIAMETER,
        color: LARGE_COLOR,
        lifetime: LARGE_LIFETIME_MS,
        score: LARGE_SCORE_VALUE,
    },
];

const scoreEl = document.querySelector("#score");
const poppedEl = document.querySelector("#popped");
const missedEl = document.querySelector("#missed");
const timeRemainingEl = document.querySelector("#time-remaining");
const startBtn = document.querySelector("#start-btn");
const gameArea = document.querySelector("#game-area");

let gameActive = false;
let score = 0;
let popped = 0;
let missed = 0;
let timeRemainingMs = GAME_DURATION_MS;
let spawnIntervalId = null;
let countdownIntervalId = null;
const circleTimeouts = new Map(); // Keeps removal timers tied to elements

startBtn.addEventListener("click", () => {
    if (!gameActive) {
        startGame();
    }
});

function startGame() {
    gameActive = true;
    score = 0;
    popped = 0;
    missed = 0;
    timeRemainingMs = GAME_DURATION_MS;
    updateHud();
    clearAllCircles();
    startBtn.disabled = true;

    spawnIntervalId = window.setInterval(spawnCircle, SPAWN_INTERVAL_MS);
    countdownIntervalId = window.setInterval(handleCountdown, 250);
}

function endGame() {
    gameActive = false;
    startBtn.disabled = false;
    window.clearInterval(spawnIntervalId);
    window.clearInterval(countdownIntervalId);
    spawnIntervalId = null;
    countdownIntervalId = null;
    clearAllCircles();
}

function handleCountdown() {
    timeRemainingMs = Math.max(0, timeRemainingMs - 250);
    timeRemainingEl.textContent = Math.ceil(timeRemainingMs / 1000);

    if (timeRemainingMs <= 0) {
        endGame();
    }
}

function spawnCircle() {
    if (!gameActive) {
        return;
    }

    const profile = circleProfiles[Math.floor(Math.random() * circleProfiles.length)];
    const circle = document.createElement("button");
    circle.className = "circle";
    circle.type = "button";
    circle.setAttribute("aria-label", `${profile.label} circle worth ${profile.score} points`);
    circle.style.width = `${profile.diameter}px`;
    circle.style.height = `${profile.diameter}px`;
    circle.style.backgroundColor = profile.color;

    const position = getRandomPosition(profile.diameter);
    circle.style.left = `${position.x}px`;
    circle.style.top = `${position.y}px`;

    const showCircle = () => circle.classList.add("circle--visible");

    requestAnimationFrame(showCircle);

    const missTimeoutId = window.setTimeout(() => {
        circleTimeouts.delete(circle);
        removeCircle(circle);
        if (gameActive) {
            missed += 1;
            updateHud();
        }
    }, profile.lifetime);

    circleTimeouts.set(circle, missTimeoutId);

    circle.addEventListener("click", () => {
        if (!gameActive || !circleTimeouts.has(circle)) {
            return;
        }

        window.clearTimeout(circleTimeouts.get(circle));
        circleTimeouts.delete(circle);
        removeCircle(circle, "pop");

        score += profile.score;
        popped += 1;
        updateHud();
    });

    gameArea.appendChild(circle);
}

function getRandomPosition(diameter) {
    const areaRect = gameArea.getBoundingClientRect();
    const maxLeft = areaRect.width - diameter;
    const maxTop = areaRect.height - diameter;
    const x = Math.random() * Math.max(0, maxLeft);
    const y = Math.random() * Math.max(0, maxTop);
    return { x, y };
}

function removeCircle(circle, reason = "miss") {
    if (reason === "pop") {
        circle.disabled = true;
        circle.classList.add("circle--popped");
        window.setTimeout(() => {
            if (circle.parentElement === gameArea) {
                gameArea.removeChild(circle);
            }
        }, POP_ANIMATION_DURATION_MS);
        return;
    }

    circle.classList.remove("circle--visible");
    // Delay removal slightly to let the transition play
    window.setTimeout(() => {
        if (circle.parentElement === gameArea) {
            gameArea.removeChild(circle);
        }
    }, 140);
}

function clearAllCircles() {
    circleTimeouts.forEach((timeoutId, element) => {
        window.clearTimeout(timeoutId);
        if (element.parentElement === gameArea) {
            gameArea.removeChild(element);
        }
    });
    circleTimeouts.clear();
}

function updateHud() {
    scoreEl.textContent = score;
    poppedEl.textContent = popped;
    missedEl.textContent = missed;
    timeRemainingEl.textContent = Math.ceil(timeRemainingMs / 1000);
}


Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnControlAddInReady');
