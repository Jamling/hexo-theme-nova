Helpers of nova are located under theme/<var>nova/script</var> folder

## Basic

### head_title

Returns page title. `title2` assigned in front-marker the title will be i18n output

### head_keyword
Return keyword meta

### head_description
Return description meta

### header_menu
Return menu navigation

### page_path
Return post path navination

### post_cates
Retrun categories in post

### post_tags
Return post tags in post

### widget_cates

List categories in post widget.

Option | Description | Default
--- | --- | ---
`show_count` | Show post count under category | true

### widget_tags

List tags in post widget.


### nova_list_categories

Inserts a list of all categories.
Similar to list_categories, used in <var>post/widget_categories.swig</var>
Only changed the ul, li, style.

``` js
<%- nova_list_categories([options]) %>
```

Option | Description | Default
--- | --- | ---
`orderby` | Order of categories | name
`order` | Sort of order. `1`, `asc` for ascending; `-1`, `desc` for descending | 1
`show_count` | Display the number of posts for each category | true
`style` | Style to display the category list. `list` displays categories in an unordered list.  | list
`separator` | Separator between categories. (Only works if `style` is not `list`) | ,
`depth` | Levels of categories to be displayed. `0` displays all categories and child categories; `-1` is similar to `0` but displayed in flat; `1` displays only top level categories. | 0
`class` | Class name of category list. | category
`transform` | The function that changes the display of category name. |

### nova_list_archives

Inserts a list of archives.
Similar to list_archives, used in post/widget_archives.swig
The helper adds archive.posts and changes class style.


``` js
<%- nova_list_archives([options]) %>
```

Option | Description | Default
--- | --- | ---
`type` | Type. This value can be `yearly` or `monthly`. | monthly
`order` | Sort of order. `1`, `asc` for ascending; `-1`, `desc` for descending | 1
`show_count` | Display the number of posts for each archive | true
`format` | Date format | MMMM YYYY
`style` | Style to display the archive list. `list` displays archives in an unordered list. **`group` displays archives in a panel** | list
`separator` | Separator between archives. (Only works if `style` is not `list`) | ,
`class` | Class name of archive list. | archive
`transform` | The function that changes the display of archive name. |
`post_limit` | The posts display limitation. (add in nova) | 10

### nova_archives
Inserts a list of archives.
Similar to list_archives, used in post/archives.swig

``` js
<%- nova_archives([options]) %>
```

Option | Description | Default
--- | --- | ---
`type` | Type. This value can be `yearly` or `monthly`. | monthly
`order` | Sort of order. `1`, `asc` for ascending; `-1`, `desc` for descending | 1
`show_count` | Display the number of posts for each archive | true
`format` | Date format | MMMM YYYY
`style` | Style to display the archive list. `list` displays archives in an unordered list. **`group` displays archives in a panel** | list
`separator` | Separator between archives. (Only works if `style` is not `list`) | ,
`class` | Class name of archive list. | archive
`transform` | The function that changes the display of archive name. |
`post_limit` | The posts display limitation. (add in nova) | 10

### nova_list_posts

Inserts a list of posts. Only changs the class style.

``` js
<%- nova_list_posts([options]) %>
```

Option | Description | Default
--- | --- | ---
`orderby` | Order of posts | date
`order` | Sort of order. `1`, `asc` for ascending; `-1`, `desc` for descending | 1
`style` | Style to display the post list. `list` displays posts in an unordered list.  | list
`separator` | Separator between posts. (Only works if `style` is not `list`) | ,
`class` | Class name of post list. | post
`amount` | The number of posts to display (0 = unlimited) | 6
`transform` | The function that changes the display of post name. |

### nova_paginator

Inserts a paginator. Similar to paginator, adds class option for paginator bar.

``` js
<%- paginator(options) %>
```

Option | Description | Default
--- | --- | ---
`base` | Base URL | /
`format` | URL format | page/%d/
`total` | The number of pages | 1
`current` | Current page number | 0
`prev_text` | The link text of previous page. Works only if `prev_next` is set to true. | Prev
`next_text` | The link text of next page. Works only if `prev_next` is set to true. | Next
`space` | The space text | &hellp;
`prev_next` | Display previous and next links | true
`end_size` | The number of pages displayed on the start and the end side | 1
`mid_size` | The number of pages displayed between current page, but not including current page | 2
`show_all` | Display all pages. If this is set true, `end_size` and `mid_size` will not works. | false
`class` | paginator ui class (add in nova). | 'pagination'

### nova_paginator2
Display a paginator bar only with previous and next, used in single page.

Option | Description | Default
--- | --- | ---
`show_name` | Show page title | false

### nova_toc

Parses all heading tags (h1~h6) in the content and inserts a table of contents.
Delete list_number option, add expand and deep option.

``` js
<%- nova_toc(str, [options]) %>
```

Option | Description | Default
--- | --- | ---
`class` | Class name | ~toc~ -> nav
~`list_number`~ | Displays list number | true
`deep` | The toc deepth | 3
`expand` | The toc max expand level | 6

**Examples:**

``` js
{{ nova_toc(page.content, {class:'nav toc-ul', deep: 6, expand:6}) }}
```
