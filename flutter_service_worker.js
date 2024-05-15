'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "724c3ee16906a10d4822bc2784ac1210",
"version.json": "489bb52dedc23fdba7226279388fc21b",
"index.html": "360d93c60fb798ce7e01bc48afe718cf",
"/": "360d93c60fb798ce7e01bc48afe718cf",
"main.dart.js": "c503af9ac5308be9a3517a5be5183918",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "6c81107f64ad3548436e8449bd783441",
"icons/Icon-192.png": "462e022e589fd8929f6f73b354741b4a",
"icons/Icon-maskable-192.png": "462e022e589fd8929f6f73b354741b4a",
"icons/Icon-maskable-512.png": "6b10c1223a25c63abdc699d96a273945",
"icons/Icon-512.png": "6b10c1223a25c63abdc699d96a273945",
"manifest.json": "40fa52946fa5321b897b7c76e5b8be1b",
"assets/AssetManifest.json": "28bbb308f50500c2651ad478d0392c68",
"assets/NOTICES": "54a486c7f4852d65af1880e8e08e4924",
"assets/FontManifest.json": "afad2aa26bf40130c155a3c24c5f200b",
"assets/AssetManifest.bin.json": "397ef1560fdd47bc0539073f973b9e59",
"assets/packages/widgetbook/assets/logo.png": "445292cbfde4f60d5b3dca36d0d6dfb2",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ThinItalic.ttf": "01555d25092b213d2ea3a982123722c9",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraLightItalic.ttf": "a9bed017984a258097841902b696a7a6",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-BoldItalic.ttf": "19406f767addf00d2ea82cdc9ab104ce",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-SemiBoldItalic.ttf": "9841f3d906521f7479a5ba70612aa8c8",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraBoldItalic.ttf": "8afe4dc13b83b66fec0ea671419954cc",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-BlackItalic.ttf": "e9c5c588e39d0765d30bcd6594734102",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-LightItalic.ttf": "0613c488cf7911af70db821bdd05dfc4",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Italic.ttf": "c1034239929f4651cc17d09ed3a28c69",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-MediumItalic.ttf": "cf5ba39d9ac24652e25df8c291121506",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "a48ca9e5bcc89fccac32592416234257",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Medium.ttf": "d08840599e05db7345652d3d417574a9",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Light.ttf": "fc84e998bc29b297ea20321e4c90b6ed",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Regular.ttf": "3e1af3ef546b9e6ecef9f3ba197bf7d2",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Bold.ttf": "ee7b96fa85d8fdb8c126409326ac2d2b",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Thin.ttf": "89e2666c24d37055bcb60e9d2d9f7e35",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Black.ttf": "ec4c9962ba54eb91787aa93d361c10a8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "bc4bed9a1d54c1f1cb357ffc6e6c3437",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/background_bassie.jpg": "9b79406e16366ce5f6699fe4c5ed7cc5",
"assets/assets/images/fietsen-min-min.jpg": "458a0179e435c2673fef8b8c6c6e3bbc",
"assets/assets/images/screenshot_7-min.jpg": "b7d2c301e30cc3cea2d8b5ebef398b7f",
"assets/assets/images/bassie-min.jpeg": "6faafe9b1c489ba0122c84c51f315ef7",
"assets/assets/images/screenshot_2-min-min.jpg": "6d8069f4de63f4715630f37d3f4a98ed",
"assets/assets/images/screenshot_8.jpg": "e16ada213e5a53879ddd5d94de1aea5a",
"assets/assets/images/screenshot_7-min-min.jpg": "b4743bb99175a6ea1bee5da0010e2a17",
"assets/assets/images/space.jpg": "73c451e80449b110a6a6196e602abcfc",
"assets/assets/images/screenshot_6-min.jpg": "410fa22fc95d38deb38962d91a6e8a5d",
"assets/assets/images/screenshot_1.jpeg": "3c363d31de711485b22ac08cc81f9ac2",
"assets/assets/images/bassie2-min-min.jpg": "461ed784e4571a4460fc829a6db17bc6",
"assets/assets/images/fietsen-min.jpg": "ca20a8ab5df3c0b1263debb453063160",
"assets/assets/images/nature-min-min.jpg": "fbe5eac9302de02a72d9132c146a19e1",
"assets/assets/images/nature-min.jpg": "87fdfe056e5ad41145d169abe55f4c35",
"assets/assets/images/screenshot_4-min-min.jpg": "6963f3ad7ef98f514e12d5ee7e026051",
"assets/assets/images/screenshot_4-min.jpg": "79f3f57d153c8076d2b1898a30b4adc5",
"assets/assets/images/background_bassie-min.jpg": "6f5d3d2188cd3498332c580c1b383faa",
"assets/assets/images/screenshot_1-min-min.jpg": "1e53aafcb2c2358492c098f93f37b1a8",
"assets/assets/images/screenshot_5-min.jpg": "0330a88b2ab64c4810276a2ab47a39f9",
"assets/assets/images/screenshot_8-min-min.jpg": "aec1548fbbe1ec56018f83d4ff511222",
"assets/assets/images/phone-min.png": "bb25017aa0902d017d7b6b913c88ea35",
"assets/assets/images/space-min.jpg": "a26918078cf892fc84c80cd697b84301",
"assets/assets/images/favicon.png": "7edad300518e67b70e2b01186ce43a13",
"assets/assets/images/screenshot_6-min-min.jpg": "3cd24b718ada2f444cb293fc29e1b765",
"assets/assets/images/screenshot_3-min-min.jpg": "b2025d7b34daf75bbde79995e8f36544",
"assets/assets/images/bassie2.jpg": "855e8ff8d296f9683f7115371e0401e0",
"assets/assets/images/screenshot_1-min.jpeg": "151a56c857734e5bf7b038aa9a97d489",
"assets/assets/images/bassie-min-min.jpg": "8fc9cd01838394aceeedaeacbad0a512",
"assets/assets/images/screenshot_8-min.jpg": "492a08422c367326213fb1a7d316c2a7",
"assets/assets/images/nature.jpg": "c2728fc2c1f62bc17df63d40ab35ef12",
"assets/assets/images/fietsen.jpg": "c85880fd17bb89d58bccdf7205dc36e8",
"assets/assets/images/phone.png": "9a0e34e35aa12dcd951ad33b064e6633",
"assets/assets/images/screenshot_3-min.jpg": "d9116580d9185818de2fd4a94452a315",
"assets/assets/images/bassie2-min.jpg": "03e3dcbf231f3ad9f091160dbf162596",
"assets/assets/images/screenshot_6.jpg": "501810516e4fd8a375cba41dc70f42df",
"assets/assets/images/screenshot_7.jpg": "dede516f95693d98c68e0e16b8cc9999",
"assets/assets/images/screenshot_5.jpg": "785eb2750297f31012fd8700b27a5e8e",
"assets/assets/images/screenshot_4.jpg": "2787819bcde8333816dda006d5ac3297",
"assets/assets/images/background_bassie-min-min.jpg": "e06521405e960b42a0f927e45580373a",
"assets/assets/images/screenshot_5-min-min.jpg": "30ad14cbdd54f1057735f442ee6d6500",
"assets/assets/images/screenshot_2-min.jpg": "be7ea79e72896940c31b7588ae452291",
"assets/assets/images/bassie.jpeg": "ae996e53e4c8f70b0abdcee1fbb55a20",
"assets/assets/images/screenshot_3.jpg": "0b920251a3bb465fafdbcada04038566",
"assets/assets/images/screenshot_2.jpg": "6f0f8f08a09be1b0519f1d2d474f5271",
"assets/assets/images/phone-min-min.jpg": "c696065a560827e8af4d883e5d3b590d",
"assets/assets/images/space-min-min.jpg": "742df890eddf26a3d0d5415f60d46f75",
"assets/assets/blogpost/fluid-ui-in-practice/example.png": "06a4412c479b731f36227ac451197a46",
"assets/assets/blogpost/rick-rrrr/rick.png": "a75593a92cec63e6c712d1dfd2f0d4ed",
"assets/assets/blogpost/rick-rrrr/comments.png": "02f44a92b025797eef88a8e4b9019e1a",
"assets/assets/blogpost/rick-rrrr/faq.png": "b353473e74400b9f641bc5af3fb88feb",
"assets/assets/blogpost/rick-rrrr/gaimon.jpg": "21464f33b1b8a93e39d35702663d733e",
"assets/assets/blogpost/fixing-fvm/tweet.png": "8879d7a0b8a326773bb71cbf14aaf356",
"assets/assets/blogpost/fixing-fvm/asdf.png": "983e858e2080ca5cb57ba999c17f1b20",
"assets/assets/blogpost/fixing-fvm/meme.png": "976caa2c9c989d8bd4e7a5c410ce3147",
"assets/assets/blogpost/fixing-fvm/contributors.png": "c0a49827882d0c72fdb168e1aa4d2cda",
"assets/assets/blogpost/fixing-fvm/aaahhhhh.png": "f58d4533062c0d139a2a501828a4edc6",
"assets/assets/blogpost/fixing-fvm/slack.png": "230eaa3a5dd8ffee14e767ff310d7731",
"assets/assets/blogpost/fluid-ui/utopia.png": "89ca03a8b3888380a856a90a874294ca",
"assets/assets/blogpost/fluid-ui/fluid-ui-banner.jpg": "b8d80e6a082dea5852820f8e3b5a2679",
"assets/assets/blogpost/fluid-ui/demo.gif": "a273ab2d4a2e947a379546dea6f3bac0",
"assets/assets/blogpost/fluttercon-2023/fluttercon-banner.png": "eb4df8f864d70d4c0f4d4b4a104ee0d7",
"assets/assets/blogpost/fluttercon-2023/fluttercon-1.png": "a06657229c9fa233cf8e826bbfa78c18",
"assets/assets/blogpost/fluttercon-2023/fluttercon-2.png": "9bd2cc82896b764ca1339cd4cc222132",
"assets/assets/blogpost/fluttercon-2023/fluttercon-3.png": "74d0613bc8868c0953369d5221c5f515",
"assets/assets/blogpost/fluttercon-2023/fluttercon-4.png": "fb1f40c9537d31291fb3d6e23c44185b",
"assets/assets/blogpost/fluttercon-2023/fluttercon-5.png": "133cfae4a8461d4cd518f391e8052dc1",
"assets/assets/blogpost/flutter-recap-2023/team.png": "f1d5edadfef5bc898bfa51da6da83dac",
"assets/assets/blogpost/flutter-recap-2023/hours.png": "f57a1fea77be670e8a0dcf719d758922",
"assets/assets/blogpost/flutter-recap-2023/widgetbook.png": "5304cd729a782be0c0ac6d009b6369bf",
"assets/assets/blogpost/flutter-recap-2023/bas2.jpg": "a9f5dc79954f1c1a1de1948f6c02312f",
"assets/assets/blogpost/flutter-recap-2023/linkedin.png": "259bb355450938aec787dceb2a042703",
"assets/assets/blogpost/flutter-recap-2023/bas1.jpg": "6ce68f88206a44cbe97e7bcd38a89b89",
"assets/assets/blogpost/flutter-recap-2023/alibi.png": "47570b5ea9ffc2637de5739ab7f73271",
"assets/assets/blogpost/developing-alibi/header-bas.jpg": "710579fd86ae0ff8192a1ab7dc15fa1b",
"assets/assets/blogpost/developing-alibi/alibi-phone.jpg": "fa1b05ece7ae1f17a62a956a25a2cf1d",
"assets/assets/blogpost/developing-alibi/alibi-laptop.jpg": "89d124fc21430e6abe73c161e5ff5876",
"assets/assets/blogpost/widgetbook-testing/widgetbook-2.png": "2d9454132512e265ce088a4f1936c693",
"assets/assets/blogpost/widgetbook-testing/widgetbook-1.png": "12a4239f8c84c47d750bb05331c565f3",
"assets/assets/blogpost/widgetbook-testing/widgetbook-banner.jpg": "4f8a8a45daafdb08d97bc7bd8667d3e6",
"assets/assets/google_fonts/Rubik-MediumItalic.ttf": "4790a18709e781a0994dc17d04fd66f5",
"assets/assets/google_fonts/FiraSans-Thin.ttf": "8205dc3e1f7953b4f52ed6a23977a6be",
"assets/assets/google_fonts/FiraSans-ExtraLightItalic.ttf": "ffffdab9fd18858235473d663b2ab325",
"assets/assets/google_fonts/FiraSans-LightItalic.ttf": "19d6dc84ea6417eb624c3313a9397e51",
"assets/assets/google_fonts/Rubik-Bold.ttf": "627d0e537f4a06a535ae956e4a87837f",
"assets/assets/google_fonts/FiraSans-Medium.ttf": "f97963c595e8acb87013c1d4e1c3c9f9",
"assets/assets/google_fonts/FiraSans-BoldItalic.ttf": "6e7fd9789e43219fec5bcefb98aa872f",
"assets/assets/google_fonts/FiraSans-Bold.ttf": "382e230417d252a0cb16c7d491b030c7",
"assets/assets/google_fonts/FiraSans-ExtraLight.ttf": "7b01a1d6efbf405007495ea871f58d42",
"assets/assets/google_fonts/FiraSans-ThinItalic.ttf": "5512e98f8b6a8f9e5f0a11546cd1e084",
"assets/assets/google_fonts/Rubik-SemiBoldItalic.ttf": "a8a77ad44dbe8c031ce7b5442661610f",
"assets/assets/google_fonts/FiraMono-Medium.ttf": "ae2376e676e06ffa41cc1133b4702c60",
"assets/assets/google_fonts/FiraSans-MediumItalic.ttf": "c4a7f4d91c0e1cda2d762796f3f887e2",
"assets/assets/google_fonts/FiraMono-Regular.ttf": "aa00c5d91c47e7b718b5cdca3dea7875",
"assets/assets/google_fonts/Rubik-Light.ttf": "86699cab89559b6f5ffd4887cb5c7a7c",
"assets/assets/google_fonts/FiraSans-BlackItalic.ttf": "57579f90e4c29a5d880a83efe78e1833",
"assets/assets/google_fonts/FiraSans-Light.ttf": "20161a557e36034d7255f22dadab5f58",
"assets/assets/google_fonts/Rubik-Medium.ttf": "e785acbf5775e9bec2129f4967a75472",
"assets/assets/google_fonts/Rubik-ExtraBoldItalic.ttf": "5f439e081a4e2980f8368285f7d0f8c9",
"assets/assets/google_fonts/Rubik-Black.ttf": "2a3b9f77607c7b691e81090c4edba341",
"assets/assets/google_fonts/FiraSans-Black.ttf": "608b764a1cc4218d10f27600ef530fa6",
"assets/assets/google_fonts/Rubik-Italic.ttf": "17538a8196fb1d1fab888c5941acf9ec",
"assets/assets/google_fonts/Rubik-LightItalic.ttf": "ac5353ac12658ccfd7eca99a25be7037",
"assets/assets/google_fonts/FiraSans-ExtraBold.ttf": "ab5e89ae3427a97125ae380280b1df7f",
"assets/assets/google_fonts/FiraSans-SemiBold.ttf": "eb5e811f2fe0408c9d0a552fcf1fb390",
"assets/assets/google_fonts/Rubik-SemiBold.ttf": "742cf1e6b879de2de937aa287fddece4",
"assets/assets/google_fonts/FiraSans-SemiBoldItalic.ttf": "a61964676efbf35bc263fe7086ef1716",
"assets/assets/google_fonts/Rubik-BlackItalic.ttf": "db5b8553106c0268251f65367ecfc3a0",
"assets/assets/google_fonts/Rubik-ExtraBold.ttf": "34215c81c17466f7aa764b441fa348df",
"assets/assets/google_fonts/Rubik-Regular.ttf": "46df28800514364ef2766f74386b1bd3",
"assets/assets/google_fonts/FiraSans-ExtraBoldItalic.ttf": "efd9cf8a84e4ddc8be4774fec875b06b",
"assets/assets/google_fonts/FiraSans-Regular.ttf": "50e780b45678ae34cef52d3e5112bd0d",
"assets/assets/google_fonts/FiraMono-Bold.ttf": "ba7aefe1d903f1f89d285a01fac887a9",
"assets/assets/google_fonts/FiraSans-Italic.ttf": "576fe2da09745b60e892fb5bbda8bf77",
"assets/assets/google_fonts/Rubik-BoldItalic.ttf": "dc069fd43e202359cfef038ce28b20ac",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
