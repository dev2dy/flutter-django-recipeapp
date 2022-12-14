from django.db import models
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField

# class Cuisine(models.Model):
#     id = models.AutoField(primary_key=True)
#     name = models.CharField(max_length=250)
#     image_url = models.CharField(max_length=250)
#     description = models.TextField()
#     cuisine = models.CharField(max_length=100)
#     course = models.CharField(max_length=100)
#     diet = models.CharField(max_length=100)
#     prep_time = models.CharField(max_length=100)
#     instructions = models.TextField()
#     image_available = models.IntegerField()

class Recipe(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=250)
    author_name = models.CharField(max_length=50, null=True)
    submitted = models.DateField(null=True)
    image_url = models.CharField(max_length=400, null=True)
    minutes = models.IntegerField()
    description = models.TextField(null=True)
    category = models.CharField(max_length=50, null=True)
    tags = ArrayField(models.CharField(max_length=100))
    search_terms = ArrayField(models.CharField(max_length=100))
    steps = ArrayField(models.TextField())
    ingredients = ArrayField(models.CharField(max_length=100))
    ingredients_raw_str = ArrayField(models.TextField())
    serving_size = models.CharField(max_length=50)
    servings = models.IntegerField()
    calories = models.DecimalField(null=True, max_digits=7, decimal_places=1)
    rating = models.DecimalField(null=True, max_digits=2, decimal_places=1)
    review_count = models.IntegerField()
    # n_steps = models.IntegerField()
    # n_ingredients = models.IntegerField()
    # nutrition = ArrayField(models.DecimalField(max_digits=7, decimal_places=1))


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    # image = models.ImageField(default="default.jpg", upload_to="profile_pics")
    favorites = models.ManyToManyField(Recipe, related_name="favorites")

    def __str__(self):
        return f"{self.user.username}"

# class TryArray(models.Model):
#     id = models.AutoField(primary_key=True)
#     tags = ArrayField(models.CharField(max_length=50))