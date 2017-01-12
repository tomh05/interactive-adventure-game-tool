var processUtterance = require('./processUtterance')

module.exports = {
	"ResetStateIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "start again" )
	},
	"RestoreStateIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "resume skill" )
	},
	"RepeatOptionsIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "repeat options" )
	},
	"RepeatSceneIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "repeat scene" )
	},
	"GoBackIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "go back" )
	},
	"AMAZON.HelpIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "help" )
	},
	"AMAZON.StopIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "exit story" )
	},
	"AMAZON.CancelIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "exit story" )
	},
	"YesIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "yes" )
	},
	"PeterIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "peter" )
	},
	"FlopsyIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "flopsy" )
	},
	"LettucesIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "lettuces" )
	},
	"RadishesIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "radishes" )
	},
	"CabbagesIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "cabbages" )
	},
	"NoIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "no" )
	},
	"HideIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "hide" )
	},
	"RunIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "run" )
	},
	"CryForHelpIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "cry for help" )
	},
	"WriggleFreeIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "wriggle free" )
	},
	"DoorIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "door" )
	},
	"GardenIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "garden" )
	},
	"ToolShedIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "tool shed" )
	},
}