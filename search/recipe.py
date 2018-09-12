import pymysql
class Recipe(object):
    def __init__(self):
        self.connection = pymysql.connect(
            host = 'localhost',
            user = 'root',
            password = 'root123',
            db = 'smartcart',
        )
        # self.connection = pymysql.connect(
        #     host = 'gp96xszpzlqupw4k.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
        #     user = 'xt2gkwa96j9t2jug',
        #     password = 'dew3bgn8w7blfl6f',
        #     db = 'u5g8pdw4xfwct2et',
        # )

    def get_recipe(self, name):
        temp = []
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT * FROM RECIPE_INDEX WHERE name LIKE %s;"
                cursor.execute(sql, "%" + name + "%")
                result = cursor.fetchall()
                for row in result:
                    temp.append({ 'id': row[0], 'name': row[1], 'image': row[2] })
                return temp
            self.connection.commit()
        except:
            print("Some Error Occured")
    
    def get_all_recipes(self):
        temp = []
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT * FROM RECIPE_INDEX"
                cursor.execute(sql)
                result = cursor.fetchall()
                for row in result:
                    temp.append({ 'id': row[0], 'name': row[1], 'image': row[2] })
                return {'recipe': temp}
            self.connection.commit()
        except:
            print("Some Error Occured")
    
    def login(self, cart_id, user_id, password):
        try:
            with self.connection.cursor() as cursor:
                sql = "INSERT INTO CART_INDEX VALUES(%s)"
                cursor.execute(sql, cart_id)
            self.connection.commit()
        except:
            print("Some Error Occured1")

        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT uid, password FROM USER where uid = %s"
                cursor.execute(sql, user_id)
                res = cursor.fetchone()
                self.connection.commit()
                if res[1] == password:
                    try:
                        with self.connection.cursor() as cursorone:
                            sql = "UPDATE USER SET cart_id = %s WHERE uid = %s"
                            cursorone.execute(sql, (cart_id, user_id))
                        self.connection.commit()
                        return { 'message': "success" }
                    except:
                        print("Some Error Occured2")
                else:
                    { 'message': "failure" }
        except:
            print("Some Error Occured3")

    def get_items(self, id):
        temp = []
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT * FROM RECIPE WHERE rid = %s"
                cursor.execute(sql, id)
                result = cursor.fetchall()
                for row in result:
                    temp.append({ 'item_id': row[1], 'quantity': row[2] })
                return { 'id': row[0], 'recipe': temp }
            self.connection.commit()
        except:
            print("Some Error Occured")

    def get_user_recipes(self, uid):
        pass

    def get_item(self, item_id):
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT * FROM items WHERE id = %s"
                cursor.execute(sql, item_id)
                result = cursor.fetchone()
                return { 'id': result[0], 'location_id': result[1], 'name': result[2], 'price': result[3], 'stock': result[4] }
            self.connection.commit()
        except:
            print("Some Error Occured")
    
    def get_location(self, location):
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT * FROM location WHERE lid = %s"
                cursor.execute(sql, location)
                result = cursor.fetchone()
                return { 'id': result[0], 'x': result[1], 'y': result[2] }
            self.connection.commit()
        except:
            print("Some Error Occured")
        
    def add_item(self, item_id, cart_id):
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT * FROM location WHERE lid = %s"
                cursor.execute(sql, location)
                result = cursor.fetchone()
                return { 'id': result[0], 'x': result[1], 'y': result[2] }
            self.connection.commit()
        except:
            print("Some Error Occured")

if __name__ == "__main__":
    rec = Recipe()
    rec.login(310, 6874, "pinkfloyd")


