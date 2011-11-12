from .settings import MEDIA_BUNDLES
from .utils import _load_root_filter, _get_key
try:
    from itertools import product
except ImportError:
    try:
        from django.utils.itercompat import product
    except ImportError:
        # Needed for Django 1.0 and 1.1 support.
        # TODO/FIXME: Remove this when nobody uses Django 1.0/1.1, anymore.
        from .itercompat import product
from mediagenerator.base import Generator
from mimetypes import guess_type
import os

class Bundles(Generator):
    def get_output(self):
        for items in MEDIA_BUNDLES:
            bundle = items[0]
            backend = _load_root_filter(bundle)
            variations = backend._get_variations_with_input()
            if not variations:
                name, content = self.generate_file(backend, bundle, {})
                yield _get_key(bundle), name, content
            else:
                # Generate media files for all variation combinations
                combinations = product(*(variations[key]
                                         for key in sorted(variations.keys())))
                for combination in combinations:
                    variation_map = zip(sorted(variations.keys()), combination)
                    variation = dict(variation_map)
                    name, content = self.generate_file(backend, bundle,
                                                       variation, combination)

                    key = _get_key(bundle, variation_map)
                    yield key, name, content

    def get_dev_output(self, name):
        bundle_combination, path = name.split('|', 1)
        parts = bundle_combination.split('--')
        bundle = parts[0]
        combination = parts[1:]
        root = _load_root_filter(bundle)
        variations = root._get_variations_with_input()
        variation = dict(zip(sorted(variations.keys()), combination))
        content = root.get_dev_output(path, variation)
        mimetype = guess_type(bundle)[0]
        return content, mimetype

    def get_dev_output_names(self):
        for items in MEDIA_BUNDLES:
            bundle = items[0]
            backend = _load_root_filter(bundle)
            variations = backend._get_variations_with_input()
            if not variations:
                for name, hash in backend.get_dev_output_names({}):
                    url = '%s|%s' % (bundle, name)
                    yield _get_key(bundle), url, hash
            else:
                # Generate media files for all variation combinations
                combinations = product(*(variations[key]
                                         for key in sorted(variations.keys())))
                for combination in combinations:
                    variation_map = zip(sorted(variations.keys()), combination)
                    variation = dict(variation_map)
                    for name, hash in backend.get_dev_output_names(variation):
                        url = '%s--%s|%s' % (bundle, '--'.join(combination), name)
                        yield _get_key(bundle, variation_map), url, hash

    def generate_file(self, backend, bundle, variation, combination=()):
        print 'Generating %s with variation %r' % (bundle, variation)
        output = list(backend.get_output(variation))
        if len(output) == 0:
            output = ('',)
        assert len(output) == 1, \
            'Media bundle "%s" would result in multiple output files' % bundle
        content = output[0]

        combination = '--'.join(combination)
        if combination:
            combination = '--' + combination

        base, ext = os.path.splitext(bundle)
        filename = base + combination + ext
        return filename, content
