<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
  <a href="https://github.com/MaDHouSe79/mh-breakcuffs/issues">
    <img src="https://img.shields.io/github/issues/MaDHouSe79/mh-breakcuffs"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-breakcuffs/watchers">
    <img src="https://img.shields.io/github/watchers/MaDHouSe79/mh-breakcuffs"/> 
  </a> 
  <a href="https://github.com/MaDHouSe79/mh-breakcuffs/network/members">
    <img src="https://img.shields.io/github/forks/MaDHouSe79/mh-breakcuffs"/> 
  </a>  
  <a href="https://github.com/MaDHouSe79/mh-breakcuffs/stargazers">
    <img src="https://img.shields.io/github/stars/MaDHouSe79/mh-breakcuffs?color=white"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-breakcuffs/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/MaDHouSe79/mh-breakcuffs?color=black"/> 
  </a>      
</p>

<p align="center">
  <img alig src="https://github-profile-trophy.vercel.app/?username=MaDHouSe79&margin-w=15&column=6" />
</p>

# My Youtube Channel and Discord
- [Subscribe](https://www.youtube.com/c/@MaDHouSe79) 
- [Discord](https://discord.gg/vJ9EukCmJQ)

# MH Break Cuffs
- You can break free 2 times but when you fail you still get cuffed.
- The idea is not mine, I saw it on an American rp server (Circuit RP).

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-policejob](https://github.com/qbcore-framework/qb-policejob)

# Add code in qb-policejob
- in `qb-policejob/client/interactions.lua` on around line 384
```lua
local function IsHandcuffed()
    return isHandcuffed
end
exports('IsHandcuffed', IsHandcuffed)

local function SetHandcuffed(state)
    isHandcuffed = state
end
exports('SetHandcuffed', SetHandcuffed)

local function SetEscorted(state)
    isEscorted = state
    TriggerEvent('hospital:client:isEscorted', isEscorted)
end
exports('SetEscorted', SetEscorted)

local function SetHandcuffStatus(state)
    TriggerServerEvent('police:server:SetHandcuffStatus', state)
end
exports('SetHandcuffStatus', SetHandcuffStatus)
```

# Replace Code for qb-minigames
- in `qb-minigames/html/js/skillbar.js` around line 18
- backup you're own code
```js
const difficultySettings = {
    easy: {
        greenZoneSize: 5, // adjust this in small increments
        speed: 15,
        streaksRequired: 1,
    },
    medium: {
        greenZoneSize: 8,
        speed: 25,
        streaksRequired: 2,
    },
    hard: {
        greenZoneSize: 6,
        speed: 35,
        streaksRequired: 3,
    },
};
```

# How to use your own skillbar script.
- Change this export in `mh-breakcuffs/client/main.lua` on line 9 to you're own export skillbar script. 
- Example
```lua
local success = exports["qb-minigames"]:Skillbar(Config.SkillbarLevel, Config.SkillbarKeys)
```

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
