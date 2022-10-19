function NovaLC() {
    this._config = {
        debug: false,
        counterTable: 'Counter',
        commentTable: 'Comment',
        donateTable: 'Donate',
        configTable: 'Config'
    }
    NovaLC.prototype.init = function (options, common, opt) {
        console.log('init LC');
        if (AV === undefined) {
            console.error('AV not loaded');
            return;
        }
        AV.init(options);
        let c = this._config;
        c.debug = options.hasOwnProperty('debug') ? options.debug : c.debug;
        if (common) {
            Object.assign(c, common);
        } else {
            opt = common;
        }

        if (opt) {
            if (opt.commentTable) {
                c.commentTable = opt.commentTable;
            }
            if (opt.counterTable) {
                c.counterTable = opt.counterTable;
            }
            if (opt.donateTable) {
                c.donateTable = opt.donateTable;
            }
            c.debug = opt.hasOwnProperty('debug') ? opt.debug : c.debug;
        }
        return this;
    }
    NovaLC.prototype.Comment = function (context) {

    }
    function Counter(context) {
        this.cId = 'xid';
        this.cCount = 'time';
        this.context = context;

        Counter.prototype.query = function (options) {
            _query(context._config.counterTable, options);
        }
        return this;
    }
    this.Counter = new Counter(this);
    NovaLC.prototype.countCounter = async function (options) {
        let that = this;
        let table = this._config.counterTable;
        let cId = this.Counter.cId;
        let cCount = this.Counter.cCount;

        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let isIndex = options.hasOwnProperty('index') ? options.index : false;
        let selector = options.hasOwnProperty('selector') ? options.selector : '.xxx-count';
        let subSelector = options.hasOwnProperty('subSelector') ? options.subSelector : '.view-count .count';

        let o = {};
        o.debug = debug
        o.all = options.all || false;
        o.count = options.count || false;

        if (isIndex) {
            var tkeys = [];
            $(selector).each(function (i) {
                var tkey = $(this).data(cId);
                tkeys.push(tkey);
            });
            o.in = { key: cId, value: tkeys };
        } else {
            let tkey = $(selector).data(cId);
            if (!tkey) {
                console.warn(`no data-${cId} found in "${selector}"`);
                tkey = this._config[cId];
            }
            o.eq = { key: cId, value: tkey };
        }
        let results = await this._query(this._config.counterTable, o);
        if (isIndex) {
            indexCallback(results, selector, subSelector);
        } else {
            normalCallback(results, selector, subSelector);
        }

        function indexCallback(results, selector, subSelector) {
            let counts = [];
            $(selector).each(function (i) {
                var tkey = $(this).data(cId);
                var c = 0;
                for (var i = 0; i < results.length; i++) {
                    var t = results[i];
                    if (t.get(cId) === tkey) {
                        c = t.get(cCount) + '';
                    }
                }
                counts.push(c);
                $(this).find(subSelector).html(c);
            });
            debug && console.log('counts', counts);
        }
        async function normalCallback(results, selector, subSelector) {
            var data;
            let dom = $(selector);
            let src = {
                xid: dom.data(cId),
                url: dom.data('url'),
                title: dom.data('title')
            }
            if (results !== undefined && results.length > 0) {
                data = results[0];
                data.increment(cCount, 1);
            } else {
                let M = AV.Object.extend(table);
                data = new M();
                data.set(cCount, 1);
                data.set(cId, src.xid);
            }

            data.set('url', src.url);
            data.set('title', src.title);
            let res = await that._save(table, data, {});
            let count = res.get(cCount);
            debug && console.log('count update to ' + count);
            if (subSelector) {
                dom.find(subSelector).html(count);
            } else {
                dom.html(count);
            }
        }
    }

    NovaLC.prototype._save = async function (table, object, options) {
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let data = await object.save();
        debug && console.log(`save ${table} object: ${data.id}`);
        return data;
    }
    NovaLC.prototype._query = async function (table, options) {
        let o = options || {};
        let debug = o.hasOwnProperty('debug') ? o.debug : this._config.debug;
        let count = o.hasOwnProperty('count') ? o.count : false;
        let select = o.hasOwnProperty('select') ? (Array.isArray(o.select) ? o.select : [o.select]) : [];
        let eq = o.hasOwnProperty('eq') ? (Array.isArray(o.eq) ? o.eq : [o.eq]) : undefined;
        let contains = o.hasOwnProperty('in') ? o.in : undefined;
        let all = o.hasOwnProperty('all') ? o.all : false;

        let query = new AV.Query(table);
        query.select(select);
        if (eq && !all) {
            for (let k of eq) {
                query.equalTo(k.key, k.value);
                debug && console.log('equalsTo', o.eq);
            }
        }
        if (contains && !all) {
            query.containedIn(o.in.key, o.in.value);
            debug && console.log('containsdIn', o.in);
        }
        if (count) {
            let res = await query.count();
            debug && console.log(`count ${table} result is ${res}`);
            return res;
        } else {
            let res = await query.find();
            debug && console.log(`query ${table}`, res);
            return res;
        }
    }
    NovaLC.prototype.countComment = async function (options) {
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let isIndex = options.hasOwnProperty('index') ? options.index : false;
        let selector = options.hasOwnProperty('selector') ? options.selector : '.xxx-count';
        let subSelector = options.hasOwnProperty('subSelector') ? options.subSelector : '.comment-count .count';

        var tkeys = [];
        var tnums = [];
        $(selector).each(function (i) {
            var url = $(this).data('url');
            tkeys.push(url);
            tnums.push(0);
        });
        let o = {
            select: 'url',
            in: {
                key: 'url',
                value: tkeys
            },
            count: !isIndex
        }
        o.all = options.all || false;
        let res = await this._query(this._config.commentTable, o);
        if (isIndex) {
            res.forEach(item => {
                let pos = tkeys.indexOf(item.get('url'));
                tnums[pos]++;
            });
            debug && console.log(`count comments result`, tnums, tkeys);
            $(selector).each(function (i) {
                var url = $(this).data('url');
                let count = tnums[tkeys.indexOf(url)];
                $(this).find(subSelector).html(count);
            });
        } else {
            debug && console.log(`count comment result`, res, tkeys);
            $(selector).find(subSelector).html(res);
        }
    }
    NovaLC.prototype.recentComment = async function (options) {
        options = options || {}
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let selector = options.hasOwnProperty('selector') ? options.selector : '#valine-recent-comments';
        let limit = options.hasOwnProperty('limit') ? options.limit : 5;

        let recents = $(selector);
        if (recents.get(0)) {
            var query = new AV.Query(this._config.commentTable);
            query.addDescending('createdAt');
            query.limit(limit);
            let res = await query.find();
            debug && console.log('recentComment', res);
            return res || [];
        }
    }
    NovaLC.prototype.topViews = async function (options) {
        options = options || {}
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let limit = options.hasOwnProperty('limit') ? options.limit : 5;

        let query = new AV.Query(this._config.counterTable);
        query.addDescending('time');
        query.notContainedIn('url', ['index.html', '/', '/index.html']);
        query.limit(limit);
        let res = await query.find();
        debug && console.log('topViews', res);
        return res || [];
    }
    NovaLC.prototype.getAnnounce = async function (options) {
        options = options || {}
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;

        let query = new AV.Query(this._config.configTable);
        query.equalTo('name', 'announce');
        query.select(['-objectId', '-createdAt', '-updatedAt']);
        let res = await query.find();
        let json = res[0].toJSON();
        debug && console.log('announce', json);
        return json;
    }
    NovaLC.prototype.getVisitors = async function (options) {
        options = options || {}
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;

        let query = new AV.Query(this._config.configTable);
        query.equalTo('name', 'visitors');
        query.select(['-objectId', '-createdAt', '-updatedAt']);
        let res = await query.find();
        let json = res[0].toJSON();
        debug && console.log('visitors', json);
        return json;
    }
    NovaLC.prototype.topDonateAmount = async function (options) {
        options = options || {}
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let limit = options.hasOwnProperty('limit') ? options.limit : 5;
        let res = await AV.Cloud.run('donateTopAmount', {limit: limit});
        return res;
    }
    NovaLC.prototype.topDonateCount = async function (options) {
        options = options || {}
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let limit = options.hasOwnProperty('limit') ? options.limit : 5;
        let res = await AV.Cloud.run('donateTopCount', {limit: limit});
        return res;
    }
    NovaLC.prototype.listDonate = async function (options) {
        options = options || {}
        let debug = options.hasOwnProperty('debug') ? options.debug : this._config.debug;
        let limit = options.hasOwnProperty('limit') ? options.limit : 5;
        let page = options.hasOwnProperty('page') ? options.page : 0;
        //let res = await AV.Cloud.run('donateList', {limit: limit, page: page});
        let ret = {
            list: [],
            total: 0
        }
        let query = new AV.Query('Donate');
        if (page == 0) {
            ret.total = await query.count();
        }
        query.addDescending('donatedAt');
        query.limit(limit);
        query.skip(limit * page);
        query.select(['-objectId', '-createdAt', '-updatedAt']);
        let res = await query.find();
        if (res !== undefined && res.length > 0) {
            res.forEach(item => ret.list.push(item.toJSON()));
        }
        return ret;
    }
    // end
    return this;
}
window.lc = window.lc || new NovaLC();