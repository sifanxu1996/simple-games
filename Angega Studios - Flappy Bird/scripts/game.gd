#script: game

extends Node

const GROUP_PIPES = "pipes"
const GROUP_GROUNDS = "grounds"
const GROUP_BIRDS = "birds"

const MEDAL_BRONZE = 5
const MEDAL_SILVER = 10
const MEDAL_GOLD = 15
const MEDAL_PLATINUM = 20

var score_best = 0 setget _set_score_best
var score_current = 0 setget _set_score_current

signal score_best_changed
signal score_current_changed

func _ready():
	stage_manager.connect("stage_changed", self, "_on_stage_changed")

func _on_stage_changed():
	score_current = 0

func _set_score_best(score_new):
	if (score_new > score_best):
		score_best = score_new
		emit_signal("score_best_changed")

func _set_score_current(score_new):
	score_current = score_new
	emit_signal("score_current_changed")