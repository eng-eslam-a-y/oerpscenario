# -*- coding: utf-8 -*-
# © 2016 Yannick Vaucher (Camptocamp)
# License AGPL-3.0 or later (http://www.gnu.org/licenses/agpl.html).
from openerp import fields, models


class ProductTemplate(models.Model):
    _inherit = 'product.template'

    em_ref = fields.Char("EM-Nummer", help="Elektro-Material nummer")