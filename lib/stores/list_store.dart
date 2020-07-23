import 'package:mobx/mobx.dart';
import 'package:todo_mobx/stores/todo_store.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newTodoTitle = '';

  @action
  void setNewTodoTitle(String todo) => newTodoTitle = todo;

  @computed
  bool get todoIsFilled => newTodoTitle.isNotEmpty;

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = '';
  }
}
