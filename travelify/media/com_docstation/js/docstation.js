/**
 * DocStation helper
 */
var DocStation = {};

DocStation.Lang = {};

DocStation.Editor = {
		
	Init: function(id, context, name, token) {
		this.id = id;
		this.context = context;
		this.name = name;
		this.token = token;
		
		var buttons = jQuery('#editor-xtd-buttons');
		
		buttons.before( jQuery('<div>', {id: 'ds-editor-list', style: 'width: 100%'}) );
		buttons.before(
			jQuery(
				'<div id="ds-uploader">\
					<div id="ds-uploader-progress"></div>\
					<div id="ds-uploader-btn" class="btn" title="'+DocStation.Lang.SELECT_FILES_TIP+'" onclick="jQuery(\'#ds-uploader-file\').click();">\
						<i class="icon-upload"></i> '+DocStation.Lang.SELECT_FILES+'\
					</div>\
					<input id="ds-uploader-file" type="file" multiple style="display: none;"/>\
				</div>'
			)
		);

		DocStation.Uploader.Init(context, token, {parent_id: id});

		this.Refresh();
	},
	
	Refresh: function() {
		jQuery.ajax({
			dataType: 'html',
			url: 'index.php?option=com_docstation&view=documents&layout=editor&format=raw&filter_parent_id='
				+ this.id + '&filter_parent_type=' + this.context,
			success: function(response) {
				jQuery('#ds-editor-list').html(response);
				SqueezeBox.initialize({});
				SqueezeBox.assign(jQuery('a.modal'), {parse: 'rel'});
			}
		});
	},
	
	Task: function(id, task) {
		var form = jQuery('<form>', {name: 'adminForm'});
		form.append( jQuery('#ds-editor-form') );
		
		var rawform = form[0];
		var selected = rawform[id];
	    if (selected) {
	        for (var f = 0; ; f++) {
	            var e = rawform["cb" + f];
	            if (!e)
	            	break;
	            e.checked = !1;
	        }
	        selected.checked = !0;

	        form.append( jQuery('<input>', {type: 'hidden', name: 'task', value: task}) );
	        form.append( jQuery('<input>', {type: 'hidden', name: 'boxchecked', value: '1'}) );
	        form.append( jQuery('<input>', {type: 'hidden', name: 'outformat', value: 'raw'}) );
	        form.append( jQuery('<input>', {type: 'hidden', name: 'layout', value: 'editor'}) );

			jQuery.post(
				'index.php?option=com_docstation',
				form.serialize(),
				function(response) {
					jQuery('#ds-editor-list').html(response);
					SqueezeBox.initialize({});
					SqueezeBox.assign(jQuery('a.modal'), {parse: 'rel'});
				}
			);
	    }
	    
	    return false;
	},
	
	Insert: function(id, title, type) {
		var tag = '<a data-marker="{docstation:' + id + '}" href="index.php?option=com_docstation&view=download&id=' + id + '">' + title + '</a>';
		window.jInsertEditorText(tag, this.name);
	}
};

DocStation.Uploader = {

	Init: function(context, token, fileds) {
		this.context = context;
		this.token = token;
		this.fields = fileds;

		if ( !this.fields.parent_id ) this.fields.parent_id = '0';
		if ( !this.fields.published ) this.fields.published = '1';
		if ( !this.fields.language ) this.fields.language = '*';
		
		if ( this.fields.useform ) {
			var inputs = ['title', 'parent_id', 'alias', 'tags', 'published', 'access', 'language'];
			
			inputs.forEach(function(element, index, array) {
				var input = jQuery('#jform_' + element);
				input.on('change', function(event) {DocStation.Uploader.fields[element] = input.val();});
				DocStation.Uploader.fields[element] = input.val();
			});
		}
		
		jQuery('#ds-uploader-file').on('change', DocStation.Uploader.Select);
		
		if (window.FileReader) {
			var dropZone = jQuery('#ds-uploader');
			
			dropZone.on('dragenter', function(event) {
				event.preventDefault();
				dropZone.addClass('hover'); return false;
			});
			dropZone.on('dragleave', function(event) {
				event.preventDefault();
				dropZone.removeClass('hover'); return false;
			});
			dropZone.on('dragover', function(event) {event.preventDefault();});
			dropZone.on('drop', DocStation.Uploader.Select);
		}
	},
	
	Select: function(event) {
		event.preventDefault();
		jQuery('#ds-uploader').removeClass('hover');
		
		var files = event.target.files === undefined ? event.originalEvent.dataTransfer.files : event.target.files;
		
		if (files === undefined || files.length === 0) {
		    return;
		}
		
		for(var i = 0; i < files.length; ++i) {
			DocStation.Uploader.Upload(files[i]);
		}
		
		if (event.target.files !== undefined) {
			var input = jQuery('#ds-uploader-file');
			input.replaceWith( input.clone( true ) );
		}
	},

	Upload: function(file) {
		var row = jQuery('<div>', {class: 'ds-uploader-row'});
		var psl = jQuery('<span>', {class: 'ds-uploader-psl'}).html('&nbsp;');
		
		row.append( jQuery('<span class="ds-uploader-name">'+file.name+'</span>') );
		row.append( jQuery('<span>', {class: 'ds-uploader-ps'}).append(psl) );
		
		jQuery('#ds-uploader-progress').append(row.fadeIn());

		var form = new FormData();
		form.append('jform[upload]', file);
		form.append('jform[parent_type]', this.context);
		form.append(this.token, '1');
		
		var inputs = ['title', 'parent_id', 'alias', 'tags', 'published', 'access', 'language'];
		
		inputs.forEach(function(element, index, array) {
			if ( DocStation.Uploader.fields[element] ) {
				if ( DocStation.Uploader.fields[element] instanceof Array) {
					form.append('jform['+element+'][]', DocStation.Uploader.fields[element]);
				}
				else {
					form.append('jform['+element+']', DocStation.Uploader.fields[element]);
				}
			}
		});

		var request = new XMLHttpRequest();
		
		request.onreadystatechange = function() {
			if (request.readyState == 4) { // DONE
				var response;
				
				try {
					response = JSON.parse(request.responseText);
				}
				catch (e) {
					var msg = 'Unknown error occurred';
					
					if (request.responseText) {
						var map = {
							'&': '&amp;',
							'<': '&lt;',
							'>': '&gt;',
							'"': '&quot;',
							"'": '&#039;'
						};

						msg = request.responseText.replace(/[&<>"']/g, function(m) { return map[m]; });
					}
					
					response = {
						result: false,
						message: msg
					};
				}
				
				// Fix for FF
				psl.css('width', '100%');
				
				row.append(
					jQuery('<span>', {
						class: 'ds-uploader-result icon-' + (response.result ? 'ok' : 'not-ok'),
						title: response.message
					}).fadeIn().on('click', function() {
						row.slideUp('fast', function () {
							row.remove();
						});
					})
				);
				
				if ( response.result ) {
					DocStation.Editor.Refresh();
				}
			}
		};
		
		request.upload.onprogress = function(event) {
			psl.css('width', Math.ceil(100 * event.loaded/event.total) + '%');
		};

		request.open('POST', 'index.php?option=com_docstation&task=document.save&id=0&format=json');
		request.send(form);
	}
};