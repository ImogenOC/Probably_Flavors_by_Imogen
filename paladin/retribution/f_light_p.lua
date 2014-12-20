-- Built by Imogen with Love
ProbablyEngine.rotation.register_custom(70, "Flavor of Light[PvP]", {

--------------
-- Keybinds --
--------------
-- Speed of Light
{ "85499", "modifier.control" },
-- Fist of Justice
{ "105593", "modifier.shift" },
-- Divine Shield
{ "642", "modifier.alt" },
--------------------
-- Priority Buffs --
--------------------
-- Liadrins Righteousness - 15% Haste (Righteousness)
{ "20154", { -- Seal of Righteousness
  "player.seal != 2",
  "!player.buff(156989)", -- Liadrins Righteousness - 15% Haste (Righteousness)
  "player.spell(152263).exists",
}},

{ "20271", { -- Judgment
  "player.seal = 2",
  "player.holypower <= 4",
  "!player.buff(156989)",
}},

-- Maraads Truth - 15% AP (Truth)
{ "31801", { -- Seal of Truth
  "player.seal != 1",
  "!player.buff(156990)", -- Maraads Truth - 15% AP (Truth)
  "player.spell(152263).exists",
}},

{ "20271", { -- Judgment
  "player.seal = 1", -- Seal of Truth
  "player.holypower <= 4",
  "!player.buff(156990)", -- Maraads Truth - 15% AP (Truth)
  "player.spell(152263).exists",
}},

-- Resume Seal of Truth if all buffs are fine.
{ "31801", {
  "player.buff(156990).duration >= 5",
  "player.buff(156989).duration >= 5",
  "player.seal != 1",
  "player.spell(152263).exists",
}},

-- Seal of Truth Sanity

-- *Seraphim* --
{ "152262" }, 

-----------------------------
-- Assorted Proc Consumers --
-----------------------------

-- Divine Crusader - Divine Storm
{ "53385", { 
  "player.holypower <= 4",
  "player.buff(144595)", -- Divine Crusader
}},

-- Selfless Healer Flash of Light
{ "19750", {
  "player.buff(114250).count = 3",
  "player.health <= 80",
}},

-----------
-- Focus --
-----------

-- Focus - Selfless Healer Flash of Light
{ "19750", {
  "player.buff(114250).count = 3",
  "focus.health <= 80",
}, "focus" },

-- Hand of Sacrifice
{ "6940", {
  "player.health > 70",
  "focus.health < 40",
}, "focus" },

-- Hand of Protection
{ "1022", {
  "focus.health < 20",
  "!focus.debuff(25771)", -- Forbearance
}, "focus" },

-- Hand of Freedom
{ "1044", {
  "focus.root",
  "!focus.buff(1044)",
}, "focus" },

{ "1044", {
  "focus.snare",
  "!focus.buff(1044)",
}, "focus" },

--------------------
-- Divine Purpose --
--------------------

{ "136494", { -- Word of Glory
  "player.buff(90174)", -- Divine Purpose
  "player.health <= 80",
}},

{ "85256", { -- Templars Verdict
  "player.buff(90174)", -- Divine Purpose
  "player.spell(85256).exists", -- Sanity
}},

-- Divine Storm
{ "53385", { -- Divine Storm
  "player.buff(90174)", -- Divine Purpose
  "player.buff(157048)",
  "player.health <= 70",
}},

-- Final Verdict
{ "157048", { -- Final Verdict
  "player.buff(90174)", -- Divine Purpose
}},

--------------------
-- Priority Heals --
--------------------

-------------------------------------
-- Seal Juggling - Empowered Seals --
-------------------------------------

-- Liadrins Righteousness - 15% Haste (Righteousness)
{ "20154", { -- Seal of Righteousness
  "player.seal != 2",
  "!player.buff(156989)", -- Liadrins Righteousness - 15% Haste (Righteousness)
  "player.spell(152263).exists",
}},

{ "20154", { -- Seal of Righteousness
  "player.seal != 2",
  "player.buff(156989).duration <= 5", -- Liadrins Righteousness - 15% Haste (Righteousness)
  "player.spell(152263).exists",
}},

{ "20271", { -- Judgment
  "player.seal = 2",
  "player.holypower <= 4",
  "player.buff(156989).duration <= 5",
  "player.spell(152263).exists",
}},

-- Maraads Truth - 15% AP (Truth)
{ "31801", { -- Seal of Truth
  "player.seal != 1",
  "!player.buff(156990)", -- Maraads Truth - 15% AP (Truth)
  "player.spell(152263).exists",
}},

{ "31801", { -- Seal of Truth
  "player.seal != 1",
  "player.buff(156990).duration <= 5", -- Maraads Truth - 15% AP (Truth)
  "player.spell(152263).exists",
}},

{ "20271", { -- Judgment
  "player.seal = 1",
  "player.holypower <= 4",
  "player.buff(156990).duration <= 5", -- Maraads Truth - 15% AP (Truth)
  "player.spell(152263).exists",
}},

-- Uther's Insight - 1% Health p/2s (Insight)
{ "31801", { -- Seal of Insight
  "player.seal != 3",
  "!player.buff(156998)", -- Uther's Insight - 1% Health p/2s (Insight)
  "player.health <= 80",
  "player.spell(152263).exists",
}},

{ "31801", { -- Seal of Insight
  "player.seal != 3",
  "player.buff(156998).duration <= 5", -- Uther's Insight - 1% Health p/2s (Insight)
  "player.health <= 80",
  "player.spell(152263).exists",
}},

{ "20271", { -- Judgment
  "player.seal = 3",
  "player.holypower <= 4",
  "player.buff(156998).duration <= 5",
  "player.health <= 80",
  "player.spell(152263).exists",
}},

-------------
-- Talents --
-------------
{ "Holy Prism" },
---------------
-- Consumers --
---------------

-- *This. Spell. Lies.* --
-- { "85673", { -- Word of Glory
--   "player.health >= 90",
--   "target.enemy",
--   "player.holypower = 1",
-- }},

-- Final Verdict
{ "157048", { -- Final Verdict
  "player.holypower >= 5",
}},

-- Templars Verdict w/o Seraphim + Sanity
{ "85256", { -- Templars Verdict
  "player.holypower >= 3",
  "!player.spell(152262).exists", -- Seraphim
  "player.spell(85256).exists", -- Sanity
}},

-- Templars Verdict w/ Seraphim (Active)
{ "85256", { -- Templars Verdict
  "player.holypower >= 3",
  "player.buff(152262)",
}},

-- Templars Verdict w/ Seraphim (Cooldown)
{ "85256", { -- Templars Verdict
  "player.holypower = 5",
  "player.spell(152262).usable",
}},


--------------------------
-- Builders w/ Seraphim --
--------------------------
-- *Seraphim CD > 6* --
-- Crusader Strike
{ "35395", {
  "player.holypower <= 4",
  "player.spell(152262).exists",
  "spell(152262).cooldown > 3",
  "!player.buff(152262)",
}},

-- Exorcism
{ "879", {
  "player.holypower <= 4",
  "player.spell(152262).exists",
  "spell(152262).cooldown > 3",
  "!player.buff(152262)",
}},

-- Judgment
{ "20271", {
  "player.holypower <= 4",
  "player.spell(152262).exists",
  "spell(152262).cooldown > 3",
  "!player.buff(152262)",
}},

-- Seraphim needs Holy Power D:
{ "20271", { -- Judgement
  "player.spell(152262).usable",
  "player.spell(152262).exists",
  "player.holypower != 5",
}},

{ "879", { -- Exorcism
  "player.spell(152262).usable",
  "player.spell(152262).exists",
  "player.holypower != 5",
}},

{ "35395", { -- Crusader Strike
  "player.spell(152262).usable",
  "player.spell(152262).exists",
  "player.holypower != 5",
}},

-- *Seraphim Active* --
-- Exorcism
{ "879", {
  "player.holypower <= 4",
  "player.buff(152262)",
  "player.spell(152262).exists",
}},
-- Crusader Strike
{ "35395", {
  "player.holypower <= 4",
  "player.spell(152262).exists",
}},
-- Judgment
{ "20271", {
  "player.holypower <= 4",
  "player.buff(152262)",
  "player.spell(152262).exists",
}},

---------------------------
-- Builders w/o Seraphim --
---------------------------
-- Exorcism
{ "879", {
  "player.holypower <= 4",
  "!player.spell(152262).exists",
}},

-- Crusader Strike
{ "35395", {
  "player.holypower <= 4",
  "!player.spell(152262).exists",
}},

-- Judgment
{ "20271", {
  "player.holypower <= 4",
  "!player.spell(152262).exists",
}},
---------------
----
-- In Combat End --
-------------------
},{
-------------------------
-- Out of Combat Start --
-------------------------
-- BoM
{ "19740", {
  "!player.buff(19740)",
}},

{ "31801", { 
  "player.seal != 1",
}, nil },

-----------------------
-- Out of Combat End --
-----------------------
},
function ()
ProbablyEngine.toggle.create('burst', 'Interface\\Icons\\ability_warrior_decisivestrike', 'Burst Button', 'Get Fucked')
end)