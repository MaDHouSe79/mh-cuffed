<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
    <a href="https://github.com/MaDHouSe79/mh-cuffed/issues">
        <img src="https://img.shields.io/github/issues/MaDHouSe79/mh-cuffed"/> 
    </a>
    <a href="https://github.com/MaDHouSe79/mh-cuffed/watchers">
        <img src="https://img.shields.io/github/watchers/MaDHouSe79/mh-cuffed"/> 
    </a> 
    <a href="https://github.com/MaDHouSe79/mh-cuffed/network/members">
        <img src="https://img.shields.io/github/forks/MaDHouSe79/mh-cuffed"/> 
    </a>  
    <a href="https://github.com/MaDHouSe79/mh-cuffed/stargazers">
        <img src="https://img.shields.io/github/stars/MaDHouSe79/mh-cuffed?color=white"/> 
    </a>
    <a href="https://github.com/MaDHouSe79/mh-cuffed/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/MaDHouSe79/mh-cuffed?color=black"/> 
    </a>      
</p>

<p align="center">
    <img src="https://komarev.com/ghpvc/?username=MaDHouSe79&label=Profile%20views&color=3464eb&style=for-the-badge&logo=star&abbreviated=true" alt="MaDHouSe79" style="padding-right:20px;" />
</p>

# My Youtube Channel
- [Subscribe](https://www.youtube.com/@MaDHouSe79) 

# MH Cuffed
- Walk When Cuffed

# For Players
- When you get cuffed by a cop you don't walk or move, with this script you also walk/run with the cop while cuffed.
- so when the cop is walking or running you are also automaticly going to walk or run animation.

# For Npc's
- You can Cuff/UnCuff, Search, Escort, Hostage, Surender or place Npc's in your vehicle for a cop chase.
- When a npc is cuffed the npc walk/run with you while you move around.

# Add code in `qb-policejob` (client side)
- in `qb-policejob/client/main.lua` at the bottom of the file.
```lua
local function GetIsHandcuffed() return isHandcuffed end
exports('GetIsHandcuffed', GetIsHandcuffed)
```

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)