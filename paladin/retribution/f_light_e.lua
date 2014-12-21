-- Built with love by Imogen
-- SPEC ID 70

local seals = {
	{{
		{ "Seal of Truth", {
			"player.seal != 1",
			"player.buff(Maraad's Truth).duration < 3",
			"player.spell(Judgment).cooldown < 1.2"
		}},
		{ "Seal of Righteousness", {
			"player.seal != 2",
			"player.buff(Liadrin's Righteousness).duration < 3",
			"player.buff(Maraad's Truth)",
			"player.spell(Judgment).cooldown < 1.2"
		}},
		{ "Judgment", {
			"player.buff(Maraad's Truth).duration < 3"
		}},
		{ "Judgment", {
			"player.buff(Liadrin's Righteousness).duration < 3"
		}},
		{{
			{ "Seal of Truth", {
				"player.seal != 1",
				"!modifier.multitarget"
			}},
			{ "Seal of Truth", {
				"player.seal != 1",
				"modifier.multitarget",
				"player.area(10).enemies < 4" 
			}},
			{ "Seal of Righteousness", {
				"player.seal != 2",
				"modifier.multitarget",
				"player.area(10).enemies >= 4" 
			}}
		}, {
			"player.buff(Maraad's Truth).duration > 3",
			"player.buff(Liadrin's Righteousness).duration > 3"
		}}
	}, "talent(7, 1)" },
	{{
		{ "Seal of Truth", {
			"player.seal != 1",
			"!modifier.multitarget"
		}},
		{ "Seal of Truth", {
			"player.seal != 1",
			"player.area(10).enemies < 4" 
		}},
		{ "Seal of Righteousness", {
			"player.seal != 2",
			"modifier.multitarget",
			"player.area(10).enemies >= 4" 
		}}
	}, "!talent(7, 1)" },
}

local singleTarget = {
	{ "Avenging Wrath", "modifier.cooldowns" },
	{ "Execution Sentence", "target.health.actual > 100000" },
	{ "Divine Storm", {
		"player.buff(Final Verdict)",
		"player.buff(Divine Crusader)"
	}},
	{ "Templar's Verdict", "player.buff(Divine Purpose)" },
	{ "Final Verdict", "player.buff(Divine Purpose)" },
	{ "Templar's Verdict", "player.holypower = 5" },
	{ "Final Verdict", "player.holypower = 5" },
	{ "Hammer of Wrath" },
	{ "Crusader Strike" },
	{ "Judgment" },
	{ "Exorcism" },
	{ "Templar's Verdict", "player.holypower >= 3" },
	{ "Final Verdict", "player.holypower >= 3" },
}

local cleaveTarget = {
	{ "Avenging Wrath", "modifier.cooldowns" },
	{ "Execution Sentence", "target.health.actual > 100000" },
	{ "Divine Storm", {
		"player.buff(Final Verdict)",
		"player.buff(Divine Crusader)",
	}},
	{ "Divine Storm", "player.buff(Divine Purpose)" },
	{ "Templar's Verdict", "player.holypower = 5" },
	{ "Final Verdict", "player.holypower = 5" },
	{ "Hammer of Wrath" },
	{ "Crusader Strike" },
	{ "Judgment" },
	{ "Exorcism" },
	{ "Templar's Verdict", "player.holypower >= 3" },
	{ "Final Verdict", "player.holypower >= 3" },
}

local multiTarget = {
	{ "Avenging Wrath", "modifier.cooldowns" },
	{ "Execution Sentence", "target.health.actual > 100000" },
	{ "Divine Storm", {
		"player.buff(Final Verdict)",
		"player.buff(Divine Crusader)",
	}},
	{ "Divine Storm", "player.buff(Divine Purpose)" },
	{ "Divine Storm", "player.buff(Final Verdict)" },
	{ "Divine Storm", "player.holypower = 5" },
	{ "Hammer of the Righteous" },
	{ "Exorcism" },
	{ "Hammer of Wrath" },
	{ "Judgment" },
	{ "Templar's Verdict", "player.holypower >= 3" },
	{ "Final Verdict", "player.holypower >= 3" },
}

ProbablyEngine.rotation.register_custom(70, "Flavor of Light [PvE]", {
	-- Survive
	{ "Rebuke", "modifier.interrupts" },
	--{ "#109223", { "modifier.cooldowns", "player.health < 15" }},
	--{ "#5512", "player.health <= 40" },
	{ "Cleanse", "player.dispellable(Cleanse)" },
	{ "Hand of Freedom", { "!player.buff", "player.state.root" }, "player" },
	{ "Flash of Light", { "player.buff(Selfless Healer).count = 3", "focus.exists", "focus.health <= 80" }, "focus" },
	{ "Flash of Light", { "player.buff(Selfless Healer).count = 3", "!focus.exists", "player.health <= 70" }, "player" },
	{ "#trinket1", "modifier.cooldowns" },
	{ "#trinket2", "modifier.cooldowns" },
	--{ "#109219", "modifier.cooldowns" },
	-- Rotation
	{ seals },
	{ singleTarget, "player.area(10).enemies < 2" },
	{ cleaveTarget, "player.area(10).enemies >= 2" },
	{ multiTarget, { "player.area(10).enemies >= 4", "modifier.multitarget" }},
	{ singleTarget }, -- fallback
}, {
	--{ "Blessing of Kings", { "!toggle.might", "!player.buff(Blessing of Kings).any" }},
	--{ "Blessing of Might", { "toggle.might", "!player.buff(Blessing of Might).any" }},
}, function()
	ProbablyEngine.toggle.create('might', 'Interface\\Icons\\spell_holy_greaterblessingofkings', 'Blessing of Might')
end)

-- NtCAFmnqd