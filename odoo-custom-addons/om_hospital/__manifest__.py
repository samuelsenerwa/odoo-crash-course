{
    'name': 'Hospital Management',
    'version': '1.0.0',
    'category': 'Hospital',
    'sequence': -100,
    'summary': 'All in one place for effective delivery',
    'description': """ Module that handles everything on hospital management""",
    'depends': [],
    'data': [
        'security/ir.model.access.csv',
        'views/menu.xml',
        'views/patient_view.xml'
    ],
    'demo': [ ],
    'installable': True,
    'auto_install': False,
    'application':True,
    'assets': { },
    'author': 'Linkyou Systems',
    'license': 'LGPL-3',
}