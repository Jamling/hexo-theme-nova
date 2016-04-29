<div class="container container-fluid">
  <div id="projects">
  {% for p in gh_repos() %}
    <!--<div class="col-sx-6 col-sm-6 col-md-6 col-lg-6">-->
      <div class="panel panel-default" id="project">
        <div class="panel-heading">
        
          <h3><svg aria-hidden="true" class="octicon octicon-repo" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path d="M4 9h-1v-1h1v1z m0-3h-1v1h1v-1z m0-2h-1v1h1v-1z m0-2h-1v1h1v-1z m8-1v12c0 0.55-0.45 1-1 1H6v2l-1.5-1.5-1.5 1.5V14H1c-0.55 0-1-0.45-1-1V1C0 0.45 0.45 0 1 0h10c0.55 0 1 0.45 1 1z m-1 10H1v2h2v-1h3v1h5V11z m0-10H2v9h9V1z"></path></svg>
          <a href="https://github.com/{{p.owner.login}}/" title="View user on github" target="_blank">{{p.owner.login}}</a>
          /
          <a href="https://github.com/{{p.owner.login}}/{{p.name}}"> {{ p.name }}</a></h3>
        </div>
        <div class="panel-body">
          <p><a href="./{{ p.name }}" title="{{ p.description }}">{{ p.description }}</a></p>
        </div>
        <div class="panel-footer">
          <iframe src="https://ghbtns.com/github-btn.html?user={{p.owner.login}}&repo={{p.name}}&&type=star&count=true" scrolling="0" frameborder="0" height="20px" width="110px"></iframe>
          <iframe src="https://ghbtns.com/github-btn.html?user={{p.owner.login}}&repo={{p.name}}&&type=fork&count=true" scrolling="0" frameborder="0" height="20px" width="110px"></iframe>
        </div>
      </div>
    <!--</div>-->
  {% endfor %}
  </div>
</div>