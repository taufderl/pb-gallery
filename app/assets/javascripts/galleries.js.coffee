# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.upload').fileUpload
      uploadTable: $('.upload_files'),
      downloadTable: $('.download_files'),
      buildUploadRow: (files, index) ->
        file = files[index]
        return $('<tr><td>' + file.name + '<\/td>' +
                 '<td class="file_upload_progress"><div><\/div><\/td>' +
                 '<td class="file_upload_cancel">' +
                 '<div class="ui-state-default ui-corner-all ui-state-hover" title="Cancel">' +
                 '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
                 '<\/div><\/td><\/tr>')
      buildDownloadRow: (file) ->
        return $('<tr><td><img alt="Photo" width="40" height="40" src="' + file.pic_path + '">' + file.name + '<\/td><\/tr>')
  