'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "489bb52dedc23fdba7226279388fc21b",
"index.html": "777c62bd62183051a5eaf3ef7c96ff8f",
"/": "777c62bd62183051a5eaf3ef7c96ff8f",
"main.dart.js": "40663b909a85e4c72321319b4802853d",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "17e2fdc2c3871caebb71e149e4f42a5d",
"assets/AssetManifest.json": "a5c93592189f1fc50f95e886c67e8848",
"assets/NOTICES": "66a6be45c93ee1c93a0f16d3d33d7392",
"assets/FontManifest.json": "19edf42864e94a1e6c21f637e64974be",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "757f33cf07178f986e73b03f8c195bd6",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "35a75863d0043a2d6e79c95dd5d2f4f1",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/assets/images/background_bassie.jpg": "9b79406e16366ce5f6699fe4c5ed7cc5",
"assets/assets/images/screenshot_8.jpg": "e16ada213e5a53879ddd5d94de1aea5a",
"assets/assets/images/space.jpg": "73c451e80449b110a6a6196e602abcfc",
"assets/assets/images/screenshot_1.jpeg": "3c363d31de711485b22ac08cc81f9ac2",
"assets/assets/images/bassie2.jpg": "855e8ff8d296f9683f7115371e0401e0",
"assets/assets/images/nature.jpg": "c2728fc2c1f62bc17df63d40ab35ef12",
"assets/assets/images/fietsen.jpg": "c85880fd17bb89d58bccdf7205dc36e8",
"assets/assets/images/phone.png": "9a0e34e35aa12dcd951ad33b064e6633",
"assets/assets/images/screenshot_6.jpg": "501810516e4fd8a375cba41dc70f42df",
"assets/assets/images/screenshot_7.jpg": "dede516f95693d98c68e0e16b8cc9999",
"assets/assets/images/screenshot_5.jpg": "785eb2750297f31012fd8700b27a5e8e",
"assets/assets/images/screenshot_4.jpg": "2787819bcde8333816dda006d5ac3297",
"assets/assets/images/bassie.jpeg": "ae996e53e4c8f70b0abdcee1fbb55a20",
"assets/assets/images/screenshot_3.jpg": "0b920251a3bb465fafdbcada04038566",
"assets/assets/images/screenshot_2.jpg": "6f0f8f08a09be1b0519f1d2d474f5271",
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
"assets/assets/google_fonts/FiraSans-MediumItalic.ttf": "c4a7f4d91c0e1cda2d762796f3f887e2",
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
"assets/assets/google_fonts/FiraSans-Italic.ttf": "576fe2da09745b60e892fb5bbda8bf77",
"assets/assets/google_fonts/Rubik-BoldItalic.ttf": "dc069fd43e202359cfef038ce28b20ac",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
