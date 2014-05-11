var App = window.App || {};

App.Create = (function ($, w) {

    'use strict';

    function Create ($el, options) {

        if (typeof $el.midgardCreate !== 'function') {
            return;
        }

        this.options = $.extend({}, Create.defaults, options);

        this.$el = $el.midgardCreate({
            url: function () {
                if (this.isNew() && this.collection) {
                    return this.collection.url;
                }

                return this.getSubjectUri();
            },
            editorOptions: {
                hallo: {
                    widget: 'halloWidget',
                    options: {
                        plugins: {
                            halloformat: {
                                formattings: {}
                            },
                            halloblock: {
                                elements: ['p', 'h2', 'h3']
                            },
                            hallolink: {},
                            hallolists: {}
                        }
                    }
                }
            }
        });

        w.Backbone.sync = this.sync.bind(this);

        return this.$el;
    }

    // Override Backbone.sync
    Create.prototype.sync = function(method, model, options) {

        if (method === 'update') {

            $.ajax({
                url: model.url(),
                type: 'put',
                data: model.toJSON(),
                dataType: 'json',
                success: function () {
                    options.success(model);
                },
                error: function () {
                    options.error(model);
                }
            });

        } else if (method === 'create') {

            $.ajax({
                url: model.url(),
                type: 'post',
                data: model.toJSON(),
                dataType: 'json',
                success: function () {
                    options.success(model);
                },
                error: function () {
                    options.error(model);
                }
            });

        } else {
            return options.error(model);
        }
    };

    Create.extractId = function(id) {
        return parseInt(id.replace(/<\/pages\/(\d+)>/, '$1'), 10);
    };

    Create.defauts = {

    };

    return Create;

}(jQuery, window));
