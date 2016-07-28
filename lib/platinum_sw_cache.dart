// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `platinum_sw_cache`.
@HtmlImport('platinum_sw_cache_nodart.html')
library polymer_elements.lib.src.platinum_sw.platinum_sw_cache;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/web_components.dart';
import 'package:polymer_interop/polymer_interop.dart';

/// The `<platinum-sw-cache>` element makes it easy to precache specific resources, perform runtime
/// caching, and serve your cached resources when a network is unavailable.
/// Under the hood, the [sw-toolbox](https://github.com/googlechrome/sw-toolbox) library is used
/// for all the caching and request handling logic.
/// `<platinum-sw-cache>` needs to be a child element of `<platinum-sw-register>`.
/// A simple, yet useful configuration is
///
///     <platinum-sw-register auto-register>
///       <platinum-sw-cache></platinum-sw-cache>
///     </platinum-sw-register>
///
/// This is enough to have all of the resources your site uses cached at runtime, both local and
/// cross-origin.
/// (It uses the default `defaultCacheStrategy` of "networkFirst".)
/// When there's a network available, visits to your site will go against the network copy of the
/// resources, but if someone visits your site when they're offline, all the cached resources will
/// be used.
@CustomElementProxy('platinum-sw-cache')
class PlatinumSwCache extends HtmlElement with CustomElementProxyMixin, PolymerBase {
  PlatinumSwCache.created() : super.created();
  factory PlatinumSwCache() => new Element.tag('platinum-sw-cache');

  /// Used to configure `<platinum-sw-precache>` behavior via a JSON file instead of via
  /// attributes. This can come in handy when the configuration (e.g. which files to precache)
  /// depends on the results of a build script.
  ///
  /// If configuration for the same properties are provided in both the JSON file and via the
  /// element's attributes, then in general the JSON file's values take precedence. The one
  /// exception is the `precache` property. Any values in the element's `precache` attribute will
  /// be concatenated with the values in the JSON file's `precache` property and the set of files
  /// that are precached will be the union of the two.
  ///
  /// There's one additional option, `precacheFingerprint`, that can be set in the JSON. If using
  /// a build script that might output a large number of files to precache, its recommended
  /// that your build script generate a unique "fingerprint" of the files. Any changes to the
  /// `precacheFingerprint` value will result in the underlying service worker kicking off the
  /// process of caching the files listed in `precache`.
  /// While there are a few different strategies for generating an appropriate
  /// `precacheFingerprint` value, a process that makes sense is to use a stable hash of the
  /// serialized `precache` array. That way, any changes to the list of files in `precache`
  /// will result in a new `precacheFingerprint` value.
  /// If your build script is Node.js based, one way to generate this hash is:
  ///
  ///     var md5 = require('crypto').createHash('md5');
  ///     md5.update(JSON.stringify(precache));
  ///     var precacheFingerprint = md5.digest('hex');
  ///
  /// Alternatively, you could use something like the
  /// [SHA-1 signature](http://stackoverflow.com/questions/1161869/how-to-get-sha-of-the-latest-commit-from-remote-git-repository)
  /// of your latest `git` commit for the `precacheFingerprint` value.
  ///
  /// An example file may look like:
  ///
  ///     {
  ///       "cacheId": "my-cache-id",
  ///       "defaultCacheStrategy": "fastest",
  ///       "disabled": false,
  ///       "precache": ["file1.html", "file2.css"],
  ///       "precacheFingerprint": "FINGERPRINT_OF_FILES_IN_PRECACHE"
  ///     }
  String get cacheConfigFile => jsElement[r'cacheConfigFile'];
  set cacheConfigFile(String value) { jsElement[r'cacheConfigFile'] = value; }

  /// An id used to construct the name for the
  /// [Cache](https://slightlyoff.github.io/ServiceWorker/spec/service_worker/#cache)
  /// in which all the resources will be stored.
  ///
  /// If nothing is provided, the default value set in
  /// [`toolbox.options.cacheName`](https://github.com/GoogleChrome/sw-toolbox/blob/8763dcc9fbc9352d58f184050e2131c42f7b6d68/lib/options.js#L28)
  /// will be used.
  ///
  /// The `cacheId` is combined with the service worker's scope to construct the cache name, so
  /// two `<platinum-sw-cache>` elements that are associated with different scopes will use
  /// different caches.
  String get cacheId => jsElement[r'cacheId'];
  set cacheId(String value) { jsElement[r'cacheId'] = value; }

  /// The caching strategy used for all requests, both for local and cross-origin resources.
  ///
  /// For a list of strategies, see the [`sw-toolbox` documentation](https://github.com/GoogleChrome/sw-toolbox#built-in-handlers).
  /// Specify a strategy as a string, without the "toolbox" prefix. E.g., for
  /// `toolbox.networkFirst`, set `defaultCacheStrategy` to "networkFirst".
  ///
  /// Note that the "cacheFirst" and "cacheOnly" strategies are not recommended, and may be
  /// explicitly prevented in a future release. More information can be found at
  /// https://github.com/PolymerElements/platinum-sw#cacheonly--cachefirst-defaultcachestrategy-considered-harmful
  String get defaultCacheStrategy => jsElement[r'defaultCacheStrategy'];
  set defaultCacheStrategy(String value) { jsElement[r'defaultCacheStrategy'] = value; }

  /// If set to true, this element will not set up service worker caching. This is useful to
  /// conditionally enable or disable caching depending on the build environment.
  bool get disabled => jsElement[r'disabled'];
  set disabled(bool value) { jsElement[r'disabled'] = value; }

  /// Used to provide a list of URLs that are always precached as soon as the service worker is
  /// installed. Corresponds to  [`sw-toolbox`'s `precache()` method](https://github.com/GoogleChrome/sw-toolbox#toolboxprecachearrayofurls).
  ///
  /// This is useful for URLs that that wouldn't necessarily be picked up by runtime caching,
  /// i.e. a list of resources that are needed by one of the subpages of your site, or a list of
  /// resources that are only loaded via user interaction.
  ///
  /// `precache` can be used in conjunction with `cacheConfigFile`, and the two arrays will be
  /// concatenated.
  List get precache => jsElement[r'precache'];
  set precache(List value) { jsElement[r'precache'] = (value != null && value is! JsArray) ? new JsObject.jsify(value) : value;}
}