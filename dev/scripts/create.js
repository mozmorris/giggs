var App = window.App || {};

App.Create = (function ($, w) {

    'use strict';

    function Create ($el, options) {

        this.options = $.extend({}, Create.defaults, options);

        $($el).midgardCreate();

        w.Backbone.sync = this.sync.bind(this);
    }

    // Override Backbone.sync
    Create.prototype.sync = function(method, model, options) {

        // only update implemented
        if (method !== 'update') {
            return options.error(model);
        }

        this.id = Create.extractId(model.id);

        $.ajax({
            url: '/pages/' + this.id,
            type: 'put',
            data: model.attributes,
            success: function () {
                options.success(model);
            },
            error: function () {
                options.error(model);
            }
        });

    };

    Create.extractId = function(id) {
        return parseInt(id.replace(/<\/pages\/(\d+)>/, '$1'), 10);
    };

    Create.defauts = {

    };

    return Create;

}(jQuery, window));
