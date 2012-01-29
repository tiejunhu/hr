// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var globalDialog;

function openDialog(url, width, height, title)
{
	width = parseInt(width)+60;
	var horizontalPadding = 30;
	var verticalPadding = 30;
	globalDialog = $('<div id="modal_dialog"><iframe src="' + url + '" frameBorder="0" scrolling="no" style="width:100%; height:100%;"/></div>').dialog({
		title: (title) ? title : 'Dialog',
		autoOpen: true,
		width: width,
		height: height,
		modal: true,
		resizable: true,
		autoResize: false,
		closeOnEscape: true,
		//position: 'top',
		overlay: {
			opacity: 0.5,
			background: "black"
		},
		close: function(event, ui)
        {
            $(this).dialog('destroy').remove();
        }
	}).width(width - horizontalPadding).height(height - verticalPadding);
	$('html, body').scrollTop(0);
}

function closeDialog()
{
	globalDialog.dialog('destroy').remove();
}

function getTree()
{
	return $("#tree").dynatree("getTree");
}

function getTable()
{
	return $("#table").dataTable();
}

function getTreeSelectionKey()
{
	var node = getTree().getActiveNode();
	var key = -1;
	if (node) {
		key = node.data.key;
	}
	return key;
}