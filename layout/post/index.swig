    <div class="wrapper">
      <div class="inner">
        {% for post in page.posts %}
        <article class="article post" itemscope itemtype="http://schema.org/Article">
          <header class="article-header">
              <h1>
                <a href="{{ url_for(post.path) }}" class="article-title" itemprop="name">{{ post.title }}</a>
              </h1>
            <a href="{{ url_for(post.path) }}" class="article-date">{{ time_tag(post.date) }}</a>
          </header>
          <section class="article-content" itemprop="articleBody">
            {% if post.excerpt %}
            {{ post.excerpt }}
            <a href="{{ url_for(post.path) }}" >more>></a>
            {% endif %}
          </section>
          <footer class="post-item-footer">
            {{ post_cates(post) }} 
            {{ post_tags(post) }}
          </footer>
        </article>
        {% endfor %}
      </div>
    </div>

    <nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>