<div class="page-intro wrapper">
  <header class="docs-header">
    <div class="docs-intro">
      <h1>Tools for a Better Web</h1>
      <p>Become a master of distributed crafts with all our surprises for developers</p>
      <br/>
    </div>
    <ul>
      <li>
        <div class="inner">
          <h3>Embark</h3>
          <p>Build powerful ÐApps</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="https://embark.status.im/"></a>
      </li>
      <li>
        <div class="inner">
          <h3>Extensions</h3>
          <p>Extend into the future!</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="../extensions/"></a>
      </li>
      <li>
        <div class="inner">
          <h3>Fiddle</h3>
          <p>Play and learn</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="../fiddle/"></a>
      </li>
    </ul>
  </header>
</div>
<div id="content-wrap">
  <div id="content" class="wrapper">
    <div id="content-inner">
      {{ partial('partial/sidebar') }}
      <article class="article-container" itemscope itemtype="http://schema.org/Article">
        <div class="article-inner">
          <div class="article">
            <div class="inner">
              <div class="article-content" itemprop="articleBody">
                {{ page_anchor(page.content) }}
              </div>
              <footer class="article-footer">
                <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>
                {{ page_nav() }}
              </footer>
            </div>
          </div>
        </div>
      </article>
    </div>
  </div>
</div>
