#include <stdio.h>
#include <string.h>

#define MAX_LUGGAGE 100

typedef struct {
  int id;
  char origin[50];
  char destination[50];
  char status[20];
} Luggage;

Luggage luggage_list[MAX_LUGGAGE];
int num_luggage = 0;

void add_luggage(Luggage* luggage) {
  if (num_luggage >= MAX_LUGGAGE) {
    printf("System full!\n");
    return;
  }
  luggage_list[num_luggage++] = *luggage;
  printf("Luggage added successfully!\n");
}

void update_luggage_status(int id, char* new_status) {
  int i;
  for (i = 0; i < num_luggage; i++) {
    if (luggage_list[i].id == id) {
      strcpy(luggage_list[i].status, new_status);
      printf("Luggage status updated successfully!\n");
      return;
    }
  }
  printf("Luggage with ID %d not found!\n", id);
}

Luggage* search_luggage(int id) {
  int i;
  for (i = 0; i < num_luggage; i++) {
    if (luggage_list[i].id == id) {
      return &luggage_list[i];
    }
  }
  return NULL;
}

void display_luggage(Luggage luggage) {
  printf("ID: %d\n", luggage.id);
  printf("Origin: %s\n", luggage.origin);
  printf("Destination: %s\n", luggage.destination);
  printf("Status: %s\n", luggage.status);
}

void display_all_luggage() {
  int i;
  if (num_luggage == 0) {
    printf("No luggage in the system.\n");
    return;
  }
  for (i = 0; i < num_luggage; i++) {
    display_luggage(luggage_list[i]);
    printf("\n");
  }
}

int main() {
  int choice, id;
  char origin[50], destination[50], new_status[20];
  Luggage new_luggage;

  while (1) {
    printf("\nAirport Luggage Handling System\n");
    printf("1. Add Luggage\n");
    printf("2. Update Luggage Status\n");
    printf("3. Search Luggage\n");
    printf("4. Display All Luggage\n");
    printf("5. Exit\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    switch (choice) {
      case 1:
        printf("Enter Luggage details:\n");
        printf("ID: ");
        scanf("%d", &new_luggage.id);
        printf("Origin: ");
        scanf("%s", new_luggage.origin);
        printf("Destination: ");
        scanf("%s", new_luggage.destination);
        strcpy(new_luggage.status, "Check-in");
    }
  }
}

