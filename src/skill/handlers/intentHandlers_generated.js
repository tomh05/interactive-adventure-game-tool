var processUtterance = require('./processUtterance')

module.exports = {
	"ResetStateIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "reset skill" )
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
		processUtterance( intent, session, request, response, "exit skill" )
	},
	"AMAZON.CancelIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "exit skill" )
	},
	"BeginIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "begin" )
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
	"CucumbersIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "cucumbers" )
	},
	"CabbagesIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "cabbages" )
	},
	"YesIntent": function ( intent, session, request, response ) {
		processUtterance( intent, session, request, response, "yes" )
	},
}