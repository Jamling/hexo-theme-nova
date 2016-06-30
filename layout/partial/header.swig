<div class="navbar-fixed1">
  <nav class="light-blue lighten-1" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="{{ url_for_lang('/') }}" class="brand-logo left"><img src="/image/logo2.png" height="56px"/></a>
      <!-- Dropdown Structure -->
      <ul id="dropdown1" class="dropdown-content">
        {%- for lang in get_langs() %}
        <li><a href="{{switch_lang(lang)}}">{{ lang_name(lang) }}</a></li>
        {%- endfor %}
      </ul>
      <ul class="left hide-on-med-and-down">
        {{ header_menu('main-nav') }}
        <!-- Dropdown Trigger -->
        <li><a class="dropdown-button" href="#!" data-activates="dropdown1">{{__('page.language')}}<i class="material-icons right">arrow_drop_down</i></a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        {{ header_menu('main-nav') }}
        {%- for lang in get_langs() %}
        <li><a href="{{switch_lang(lang)}}">{{ lang_name(lang) }}</a></li>
        {%- endfor %}
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse right"><i class="material-icons">menu</i></a>
      <script>
      $(".button-collapse").sideNav();
      </script>
    </div>
  </nav>
</div>