import glob

__version__ = '0.3.1'

setup_args = {
    'name': 'corr',
    'author': 'Jason Manley',
    'author_email': 'jason_manley at hotmail.com',
    'license': 'GPL',
    'package_dir': {'corr':'corr'},
    'packages': ['corr'],
    'scripts': glob.glob('scripts/*.*'),
    'package_data': {'corr': ['LICENSE.txt']},
    'version': __version__,
}

if __name__ == '__main__':
    from distutils.core import setup
    apply(setup, (), setup_args)
