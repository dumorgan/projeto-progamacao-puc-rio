import re
from models import Session, ApplianceType, PhysicalQuantity
import difflib


class Transformer:
    """
    Class that get outputs from extractor and transforms, names of entities/attributes into database ids
    """
    @property
    def dataset(self):
        return self._dataset

    @dataset.setter
    def dataset(self, dataset):
        self._dataset = dataset

    @property
    def appliance_types(self):
        return self._appliance_types

    @property
    def all_types(self):
        return self._all_types

    @property
    def all_ids(self):
        return self._all_ids

    @property
    def quantities(self):
        return self._quantities

    @property
    def quantity_ids(self):
        return self._quantity_ids

    @staticmethod
    def get_appliance_type_info():
        """
        gets all appliance types as lists
        :return: list o appliance type name, list of appliance type id
        """
        appliance_types = {}
        session = Session()
        types = session.query(ApplianceType).all()
        all_types = []
        all_ids = []
        for appliance_type in types:
            appliance_types[appliance_type.appliance_type_name] = \
                {'aliases': appliance_type.aliases, 'id': appliance_type.id}
            all_types = all_types + [appliance_type.appliance_type_name]
            all_types = all_types + appliance_type.aliases
            all_ids = all_ids + [appliance_type.id]
            all_ids = all_ids + ([appliance_type.id] * len(appliance_type.aliases))
        return appliance_types, all_types, all_ids

    @staticmethod
    def get_physical_quantity_info():
        """
        gets all physical quantities as list
        :return: list of quantity name, list of quantity id
        """
        quantities = []
        quantity_ids = []
        session = Session()
        physical_quantities = session.query(PhysicalQuantity).all()
        for q in physical_quantities:
            quantities.append(q.quantity_name)
            quantity_ids.append(q.id)
        return quantities, quantity_ids

    def __init__(self, dataset):
        """
        constructor to Transformer class
        :param dataset: dataset dict
        gets information of appliances and quantities from database
        """
        self._dataset = dataset
        self._appliance_types, self._all_types, self._all_ids = Transformer.get_appliance_type_info()
        self.name_matches = []
        self._quantities, self._quantity_ids = Transformer.get_physical_quantity_info()

    def match_appliance_names(self, appliance):
        """
        matches an appliance to known dictionary of "ground-truth" appliance names
        :param appliance: dict containing key appliance_label ->
        :return: modified appliance dict if there was a match
                none if no good match happened
        """
        appliance_label = appliance['appliance_label'].values[0]
        closest_matches = difflib.get_close_matches(appliance_label, self.all_types)
        ids = []
        for match in closest_matches:
            for i, el in enumerate(self.all_types):
                if match == el:
                    ids.append(self.all_ids[i])
        self.name_matches.append({"input": appliance_label, "output": closest_matches, "ids": ids})
        try:
            appliance['appliance_label_id'] = ids[0]
            appliance['new_appliance_label'] = closest_matches[0]
            return appliance
        except IndexError:
            print("No good match found for %s " % appliance_label)
        # appliance['appliance_label'] = None
            return None

    def transform_appliance_names(self):
        """
        iterates through all appliance in a house and transformes its name using match_appliance_names function
        :return:
        """
        for house in self.dataset:
            house['appliances'] = filter(lambda appliance: appliance is not None,
                                         map(lambda appliance: self.match_appliance_names(appliance),
                                             house['appliances']))
            yield house

    # function to return dict for renaming columns according to our database quantity types
    def quantity_rename(self, input_columns):
        column_rename_dict = {}
        for column in input_columns:
            quantity_matches = difflib.get_close_matches(column, self.quantities)
            for i, el in enumerate(self.quantities):
                try:
                    if el == quantity_matches[0]:
                        column_rename_dict.update({column: self.quantity_ids[i]})
                        break
                except IndexError:
                    print("No good match for column %s" % column)
        return column_rename_dict

    @staticmethod
    def filter_column_for_renaming(col):
        return ('timestamp' not in col) and ('appliance' not in col) and (not col.startswith('is_on'))

    def rename_appliance_quantities(self, appliance):
        #for appliance in house['appliances']:
        # gets columns that aren't neither timestamps nor appliances nor on/off
        appliance_quantity_cols = filter(lambda col: Transformer.filter_column_for_renaming(col), appliance.columns)
        return appliance.rename(index=str, columns=self.quantity_rename(appliance_quantity_cols))

    # function that iterates over dataset columns and rename them according to database quantity types
    def transform_physical_quantities(self, transformed_appliances_names):
        # iterates over houses
        for house in transformed_appliances_names:
            print("reading aggregate")
            # gets aggregate data columns that are not timestamps
            aggregate_columns = list(
                filter(lambda col: Transformer.filter_column_for_renaming(col), house['aggregate'].columns)
            )
            # renames aggregate columns
            house['aggregate'].rename(index=str, columns=self.quantity_rename(aggregate_columns), inplace=True)
            # iterates over house appliances
            house['appliances'] = map(lambda appliance: self.rename_appliance_quantities(appliance=appliance),
                                      house['appliances'])
            yield house

    def transform_dataset(self):
        transformed_appliances_names = self.transform_appliance_names()
        return self.transform_physical_quantities(transformed_appliances_names)



