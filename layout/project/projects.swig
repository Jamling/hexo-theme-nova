<div class="container container-fluid">
  <h1 style="display:none;">Github Projects</h1>
  <div id="projects">
  <h2 style="display:none;">Polular Projects</h2>
  {%- for p in gh_repos() %}
    <!--<div class="col-sx-6 col-sm-6 col-md-6 col-lg-6">-->
      <div class="panel panel-default project">
        <div class="panel-heading">
          <h3>
            <span class="icon nova-repo black-text"></span>
            <a href="./{{ p.name }}" target="_blank" title="{{p.name}}"> {{ p.name }}</a>
            <a href="https://github.com/{{p.owner.login}}/{{p.name}}" target="_blank" title="view on github"><span aria-hidden="true" class="icon nova-github right black-text"></span></a>
          </h3>
        </div>
        <div class="panel-body">
          <p>{{ p.description }}</p>
        </div>
        <div class="panel-footer">
          <iframe src="https://ghbtns.com/github-btn.html?user={{p.owner.login}}&repo={{p.name}}&&type=star&count=true" class="github-iframe" height="20" width="110"></iframe>
          <iframe src="https://ghbtns.com/github-btn.html?user={{p.owner.login}}&repo={{p.name}}&&type=fork&count=true" class="github-iframe" height="20" width="110"></iframe>
        </div>
      </div>
    <!--</div>-->
  {% endfor %}
  </div>
</div>