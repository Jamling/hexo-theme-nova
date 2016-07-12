<header>
  <nav id="main-nav" class="navbar navbar-inverse navbar-fixed-top">
    <div class="container container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="{{ url_for_lang('') }}" id="logo"><img src="/image/logo.png" height="50"></a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
        {{ header_menu('main-nav') }}
        </ul>
        <form class="navbar-form navbar-left" role="search">
          <div class="form-group search">
            <!-- search input -->
            {{ partial('baidu_search_si') }}
          </div>
        </form>
        <ul class="nav navbar-nav navbar-right">
              
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{__('page.language')}} <span class="caret"></span></a>
            <ul class="dropdown-menu">
              {%- for lang in get_langs() %}
              <li><a href="{{switch_lang(lang)}}">{{ lang_name(lang) }}</a></li>
              {%- endfor %}
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>
