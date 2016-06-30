<div class="container container-fluid">
  <div id="projects">
  {% for p in gh_repos() %}
    <!--<div class="col-sx-6 col-sm-6 col-md-6 col-lg-6">-->
      <div class="panel panel-default card widget" id="project">
        <div class="panel-heading">
        
          <h3 class="panel-title" style="display:block;">
            <span class="icon nova-repo black-text"></span>
            <a href="./{{ p.name }}" target="_blank" title="{{p.name}}"> {{ p.name }}</a>
            <span aria-hidden="true" class="icon nova-github right black-text"><a href="https://github.com/{{p.owner.login}}/{{p.name}}" target="_blank" title="view on github"></a></span>
          </h3>
        </div>
        <div class="panel-body card-content">
          <p>{{ p.description }}</p>
        </div>
        <div class="panel-footer card-action">
          <iframe src="https://ghbtns.com/github-btn.html?user={{p.owner.login}}&repo={{p.name}}&&type=star&count=true" scrolling="0" frameborder="0" height="20px" width="110px"></iframe>
          <iframe src="https://ghbtns.com/github-btn.html?user={{p.owner.login}}&repo={{p.name}}&&type=fork&count=true" scrolling="0" frameborder="0" height="20px" width="110px"></iframe>
        </div>
      </div>
    <!--</div>-->
  {% endfor %}
  </div>
</div>