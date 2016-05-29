    <div class="wrapper">
      <div class="inner">
        {% for post in page.posts %}
        <article class="article post" itemscope itemtype="http://schema.org/Article">
          <header class="article-header">
              <h1>
                <a href="{{ url_for_lang(post.path) }}" class="article-title" itemprop="name">{{ post.title }}</a>
              </h1>
            <a href="{{ url_for_lang(post.path) }}" class="article-date">{{ time_tag(post.date) }}</a>
          </header>
          <section class="article-content" itemprop="articleBody">
            {% if post.excerpt %}
            {{ post.excerpt }}
            {% endif %}
          </section>
	  <div class="content-more">
            {% if post.excerpt %}
            <a href="{{ url_for_lang(post.path) }}" class="btn"><span>
	    {{__('page.more')}}<svg aria-hidden="true" class="octicon" width="16" height="10" y="0px"
	     viewBox="0 0 298.678 298.678" style="fill:currentColor; line-height:1;" >
	    <polygon points="59.421,0.839 0,0.839 118.842,148.439 0,297.839 59.421,297.839 178.263,148.439 	"/>
	    <polygon points="179.836,0.839 120.415,0.839 239.257,148.439 120.415,297.839 179.836,297.839 298.678,148.439 	"/>
            </svg></span>
	    </a>
	    {% endif %}
	  </div>
          <footer class="post-item-footer">
            {{ post_cates(post) }} 
            {{ post_tags(post) }}
          </footer>
        </article>
	  <hr>
        {% endfor %}
      </div>
    </div>

    <nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>