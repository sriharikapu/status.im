<div class="page-intro wrapper">
  <header class="docs-header">
    <div class="docs-intro">
      <h1>Contribute to a Better Web</h1>
      <p>It's all about the people, after all</p>
      <br/>
    </div>
    <ul>
      <li>
        <div class="inner">
          <h3>Life at Status</h3>
          <p>Day-to-day decentralization</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="life_status.html"></a>
      </li>
      <li>
        <div class="inner">
          <h3>Our Principles</h3>
          <p>A principled approach</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="our_principles.html"></a>
      </li>
      <li>
        <div class="inner">
          <h3>Working Here</h3>
          <p>See our open positions!</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="open_positions.html"></a>
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
