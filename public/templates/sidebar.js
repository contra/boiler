define(function(){return function anonymous(locals,attrs,escape,rethrow,merge){attrs=attrs||jade.attrs,escape=escape||jade.escape,rethrow=rethrow||jade.rethrow,merge=merge||jade.merge;var buf=[];with(locals||{}){var interp;buf.push('<div class="sidebar-nav"><ul class="nav nav-list"><li data-page="index"><a href="/">Home</a></li><li class="nav-header">Users</li><li data-user="1"><a href="/user/1">User 1</a></li><li data-user="2"><a href="/user/2">User 2</a></li><li data-user="3"><a href="/user/3">User 3</a></li></ul></div>')}return buf.join("")}})