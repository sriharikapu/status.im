<div class="page-intro wrapper">
  <header class="docs-header">
    <div class="docs-intro">
      <h1>Extend into a Better Web</h1>
      <p>Status Extensions will literally blow your mind</p>
      <br/>
    </div>
    <ul>
      <li>
        <div class="inner">
          <h3>Developer Tools</h3>
          <p>#MakeCodingGreatAgain</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="/developer_tools/"></a>
      </li>
      <li>
        <div class="inner">
          <h3>Fiddle</h3>
          <p>Play with even more</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="/fiddle/"></a>
      </li>
      <li>
        <div class="inner">
          <h3>Build Status</h3>
          <p>For Mobile and Desktop</p>
        </div>
        <img src="../img/arrow_blue_shaded.svg" />
        <a href="/build_status/"></a>
      </li>
    </ul>
  </header>
</div>

<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/codemirror@5.40.2/lib/codemirror.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/codemirror@5.40.2/mode/clojure/clojure.js"></script>
<script src="https://cdn.jsdelivr.net/npm/parinfer@3.12.0/parinfer.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/parinfer-codemirror@1.4.2/parinfer-codemirror.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/ipfs/dist/index.min.js"></script>
<script src="https://cdn.rawgit.com/neocotic/qrious/master/dist/qrious.js"></script>
<script src="/js/extensions/pluto.js"></script>
<script>
    const ipfs = new window.Ipfs();

    async function load() {
      const buffer = await loadIPFS(ipfs, "QmWKqSanV4M4zrd55QMkvDMZEQyuHzCMHpX1Fs3dZeSExv");
      return buffer.toString();
    }

    ipfs.once("ready", async () => {
      const content = await load();
      codeMirror.setValue(content);
    })

    function extensionLink(hash) {
      return "https://get.status.im/extension/ipfs@" + hash;
    }

    async function loadIPFS(ipfs, hash) {
      return ipfs.files.cat(hash);
    }

    async function publish() {
      const content = codeMirror.getValue();
      const filesAdded = await uploadIPFS(ipfs, content);
      displayQR(extensionLink(filesAdded[0].hash));
    }

    function clearErrors() {
      const elErrors = document.getElementById("errors");
      elErrors.innerHTML = '';
      elErrors.className = "";
    }

    function displayErrors(errors) {
      const elErrors = document.getElementById("errors");
      if (errors == null) {
        elErrors.innerHTML = '<div>No errors</div>';
        elErrors.classList.add("ok");
      } else {
        elErrors.classList.add("errors");

        let names = errors.map( (error, i) => {
          return [error.type, error.value]
        })
        var s = '<div>Errors</div><ul>';
        names.forEach(function(element) {
          s = s.concat("<li>" + element[0]);
          if (element[1] != null) {
            s = s.concat(":" + JSON.stringify(element[1]));
          }
          s = s.concat("</li>");
        });
        s = s.concat("</ul>")
        elErrors.innerHTML = s;
      }
    }

    function uploadIPFS(ipfs, s) {
      return ipfs.files.add({path: 'extension.edn',
                            content: ipfs.types.Buffer.from(s, 'utf8')})
    }

    function clearQR() {
      const qel = document.getElementById("qr-wrapper");
      qel.innerHTML = '';
    }

    function displayQR(s) {
      const qel = document.getElementById("qr-wrapper");
      qel.innerHTML = '<canvas id="qr"></canvas><a href="' + s + '">Universal link</a>';
      new QRious({
            element: document.getElementById('qr'),
            value: s,
            size: 250
      });
    }
  </script>
<div id="play-page">
<div id="wrapper">
    <main>
      <div id="content"></div>
      <div id="errors"></div>
    </main>
    <aside id="side-column">
      <div id="panel">
      <p>A playground to experiment with extensions and easily publish them on IPFS. Go ahead, modify the default extension on the left side!</p>
      <p>Find more details about building your own extension in this <a href="./tutorial_chat_command.html">tutorial</a></p>
      <button class="button button--blue" onclick="publish()">Publish</button>
      <div id="qr-wrapper"></div>
      </div>
      <div id="docs">
	<h6>Components</h6>
	<ul>
	  <li><code>view</code></li>	  
	  <li><code>text</code></li>
	  <li>
	    <code>touchable-opacity</code>
	    <pre class="inline-args">{:on-press Event}</pre>
	  </li>
	  <li>
	    <code>image</code>
	    <pre class="inline-args">{:uri String}</pre>
	  </li>
	  <li>
	    <code>input</code>
	    <pre>{:on-change Event
 :placeholder String}</pre></li>
	  <li>
	    <code>button</code>
	    <pre class="inline-args">{:on-click Event}</pre></li>
	  <li>
	    <code>link</code>
	    <pre class="inline-args">{:uri String}</pre>
	  </li>
	  <li>
	    <code>checkbox</code>
	    <pre class="inline-args">{:uri String}</pre>
	  </li>
	  <li>
	    <code>checkbox</code>
	    <pre class="inline-args">{:on-change Event :checked Bool}</pre>
	  </li>
	  <li>
	    <code>nft-token-viewer</code>
	    <pre class="inline-args">{:token String}</pre>
	  </li>
	  <li><code>transaction-status</code>
	      <pre class="inline-args">{:outgoing String :tx-hash String}</pre></li>
	  <li><code>asset-selector</code></li>
	  <li><code>token-selector</code></li>	  
	</ul>
        <h6>Queries</h6>
        <ul>
   	  <li>
	    <code>store/get</code>
	    <pre class="inline-args">{:key String}</pre>
	  </li>
	  <li>
	    <code>wallet/collectibles</code>
	    <pre class="inline-args">{:token String :symbol String}</pre>
	  </li>		
        </ul>
	<h6>Events</h6>
	<ul>
	  <li>
	    <code>alert</code>
	    <pre class="inline-args">{:value String}</pre>
	  </li>
	  <li>
	    <code>log</code>
	    <pre class="inline-args">{:value String}</pre>
	  </li>
	  <li>
	    <code>store/put</code>
	    <pre class="inline-args">{:key String :value String}</pre>
	  </li>
	  <li>
	    <code>store/append</code>
	    <pre class="inline-args">{:key String :value String}</pre>
	  </li>
	  <li>
	    <code>store/clear</code>
	    <pre class="inline-args">{:key String}</pre>
	  </li>
	  <li>
	    <code>http/get</code>
	    <pre>{:url String
 :timeout?    String
 :on-success  Event
 :on-failure? Event}</pre>
	  </li>
	  <li>
	    <code>http/post</code>
	    <pre>{:url String
 :body String	      
 :timeout?    String
 :on-success  Event
 :on-failure? Event}</pre>
	  </li>
	  <li>
	    <code>ipfs/cat</code>
	    <pre>{:hash String
 :on-success  Event
 :on-failure? Event}</pre>
	  </li>
	  <li>
	    <code>ethereum/send-transaction</code>
	    <pre>{:to String
 :gas?       String
 :gas-price? String
 :value?     String
 :method?    String
 :params?    Vector
 :nonce?     String
 :on-result? Event}</pre>
	  </li>
	  <li>
	    <code>ethereum/call</code>
	    <pre>{:to String
 :method    String
 :params?    Vector
 :on-result? Event}</pre>
	  </li>	  	  
	</ul>
      </div>
    </aside>
  </div>
</div>

<script>
  const codeMirror = CodeMirror(document.getElementById("content"));
  codeMirror.setValue("Loading content ...");
  codeMirror.on("change", function(c, change) {
    clearErrors();
    clearQR();
    const read = pluto.reader.read(codeMirror.getValue());
    const readJS = pluto.js.from_clj(read);
    displayErrors(readJS.errors);
    if (readJS.errors == null) {
      const parsed = pluto.js.parse(read);
      const parsedJS = pluto.js.from_clj(parsed);
      displayErrors(parsedJS.errors);
    }
  });
  parinferCodeMirror.init(codeMirror);
</script>