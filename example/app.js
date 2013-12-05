(function () {
    'use strict';
    var timods, win, items, section, i, l, list;

    // Prepare
    timods = require('com.chatwork.ac2013.timods');
    win = Ti.UI.createWindow({
        backgroundColor: '#FFFFFF'
    });
    items = [];

    for (i = 0, l = 100; i < l; i++) {
        items.push({
            template: Ti.UI.LIST_ITEM_TEMPLATE_SUBTITLE,
            properties: {
                title: 'Title #' + i,
                subtitle: 'ChatWork Advent Calender 2013'
            }
        });
    }

    section = Ti.UI.createListSection({
        items: items
    });
    list = Ti.UI.createListView({
        sections: [section]
    });

    // ListView Extended Event Listener
    list.addEventListener('scroll', function (e) {
        // alert(e);
    });

    list.addEventListener('scrollend', function (e) {
        // alert(e);
    });

    list.addEventListener('dragstart', function (e) {
        // alert(e);
    });

    list.addEventListener('dragend', function (e) {
        // alert(e);
    });

    // Open
    win.add(list);
    win.open();
}());
