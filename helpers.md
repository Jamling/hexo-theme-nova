Helpers of nova are located under theme/<var>nova/script</var> folder

## Basic

### head_title

Returns page title. `title2` assigned in front-marker the title will be i18n output

### widget_cates

List categories in post widget.

Option | Description | Default
--- | --- | ---
`show_count` | Show post count under category | true

### widget_tags

List tags in post widget.

### page_toc

Return show page table of contents or not

### nova_list_archives
Similar to list_archives, used in post/<var>widget_archives.swig</var>

### nova_archives
Similar to list_archives, used in post/<var>archives.swig</var>

### nova_list_categories
Similar to list_categories

### nova_list_posts
Similar to list_posts

### nova_paginator
Similar to paginator, display a paginator bar, used in list page.

### nova_paginator2
Display a paginator bar only with previous and next, used in single page.

Option | Description | Default
--- | --- | ---
`show_name` | Show page title | false


## Github

### gh_timee

Display date of github api, `yyyy-MM-dd` format


### gh_file_size

Display formated file size

``` js
{{gh_file_size(bytes)}}
```

### gh_repos

Return github user's repos

``` js
{{ gh_repos({user: 'Jamling'}) }}
```

Option | Description | Default
--- | --- | ---
`user` | Github user | theme.gh.user

### gh_repo_contents

Display github contents

``` js
{{ gh_repo_contents({path: 'README'}) }}
```

Option | Description | Default
--- | --- | ---
`user` | Github user | theme.gh.user
`repo` | Github repo | current repo
`path` | Github Content path | README
`ref` | Github reference | master

### gh_repo_releases

Display github repo releases

``` js
{{ gh_repo_releases({}) }}
```

Option | Description | Default
--- | --- | ---
`user` | Github user | theme.gh.user
`repo` | Github repo | current repo

