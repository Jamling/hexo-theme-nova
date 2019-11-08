{% set archive = theme.archive %}
{{ nova_archives({type: archive.type, order: archive.order, show_count: archive.show_count, class: '', style: 'page'}) }}

<nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>
