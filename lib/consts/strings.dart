abstract class AppStrings {
  static const empty = "";
  static const appName = "About lymphoma";
  static const startPageAboutApp = "Весь ход лечения в вашем телефоне: "
      "cледите за лечением, записями к врачам "
      "и получайте рекомендации по анализам.";

  static const register = "Зарегистрироваться";
  static const registration = "Регистрация";
  static const login = "Войти";
  static const logon = "Вход";
  static const alreadyHaveAccount = "Уже есть аккаунт?";

  static const forgotPassword = "Забыли пароль?";
  static const recovery = "Восстановление";

  static const recoveryHint = "Введите почту указанную при регистрации, "
      "на нее придет инструкция для восстановления пароля";

  static const recoverPassword = "Восстановить пароль";
  static const checkYourEmail = "Проверьте вашу почту";
  static const ifAccountExistBegin = "Если аккаунт";
  static const ifAccountExistEnd = "существует, вам придет письмо с инструкцией для восстановления пароля";
  static const toStartPage = "На главную";
  static const continueText = "Продолжить";

  static const sendRequest = "Отправить запрос";
  static const requestStatusTitle = "Запрос успешно\nотправлен врачу";
  static const requestStatusSubtitle = "Ответ придет в течение дня.\nО подтверждении аккауанта\nмы оповестим вас через почту.";
  static const didntGeEmail = "Не получили письмо? Проверьте раздел спам или попробуйте";
  static const rewriteEmail = "ввести другую почту";
  static const emailNotConfirmed = "Почта не подтверждена";
  static const invalidLoginOrPassword = "Неправильные логин или пароль";
  static const unknownError = "Неизвестная ошибка";
  static const emailAlreadyExist = "Пользователь уже существует";
  static const profile = "Профиль";
  static const uploadImage = "Загрузить изображение";
  static const changeImage = "Изменить изображение";
  static const notifications = "Уведомления";
  static const newPatients = "Новые пользователи";
  static const comingRecord = "Ближайшая запись";
  static const hystory = "История";
  static const appointments = "Записи";
  static const conclusions = "Заключения";
  static const treatmentCourse = "Ход лечения";
  static const recommendations = "Рекомендации";
  static const psychologicalTests = "Психологические тесты";
  static const patientProfile = "Карта пациента";
}

abstract class FieldLabels {
  static const email = "Почта";
  static const password = "Пароль";
  static const fullName = "ФИО";
  static const birthdate = "Дата рождения";
  static const phoneNumber = "Телефон";
  static const familyPhoneNumber = "Телефон родственника";
  static const phoneDoctor = "Телефон для связи";
  static const typeDoctor = "Направление врача";
  static const room = "Кабинет";
  static const therapist = "Лечащий врач";
  static const diagnosis = "Диагноз";
  static const hystDiagnosis = "Гистологический диагноз";
  static const treatment = "Назначенное лечение";
  static const repeatPassword = "Повторите пароль";
  static const appointmentDate = "Дата записи";
  static const appointmentTime = "Время записи";
}

abstract class FieldHints {
  static const enterEmail = "Введите почту";
  static const enterPassword = "Введите пароль";
  static const repeatPassword = "Повторите пароль";
  static const enterFullName = "Введите Фамилию Имя Отчество";
  static const enterDate = "Выберите дату";
  static const enterPhoneNumber = "Введите ваш номер телефона";
  static const enterFamilyPhoneNumber = "Введите номер телефона близкого";
  static const enterPhoneDoctor = "Введите телефон для связи";
  static const enterTypeDoctor = "Введите направление врача";
  static const enterRoom = "Введите номер кабинета";
  static const enterTherapist = "Введите лечащего врача";
  static const enterDiagnosis = "Введите диагноз";
  static const enterHystDiagnosis = "Введите гистологический диагноз";
  static const enterTreatment = "Введите назначенное лечение";
  static const enterBirthdate = "Нажмите чтобы выбрать";
  static const enterTime = "Выберите время";
}

abstract class FieldErrors {
  static const invalidFormat = "Неверный формат";
  static const passwordsNotEqual = "Пароли не совпадают";
  static const mustNotBeEmpty = "Не должно быть пустым";
}

abstract class DoctorTypes {
  static const psychiatrist = "Психиатр";
  static const rehabilitologist = "Реабилитолог";
  static const oncologist = "Онколог";
}

abstract class TabNames {
  static const records = "Записи";
  static const patients = "Пациенты";
  static const doctors = "Врачи";
}

abstract class ListTitles {
  static const onCurrentWeek = "На этой неделе";
  static const all = "Все";
  static const favorites = "Избранные";
  static const allList = "Весь список";
  static const registrationRequests = "Запросы на регистрацию";
}

abstract class LogicStrings {
  static const init = "init";
  static const ok = "ok";
}

abstract class TableNames {
  static const doctors = "doctors";
  static const patients = "patients";
  static const appointments = "appointments";
  static const jtPatientsDoctors = "jt_patients_doctors";
}

abstract class TableFieldNames {
  static const id = "id";
  static const fullName = "full_name";
  static const birthdate = "dob";
  static const phone = "phone";
  static const familyPhone = "phone_2";
  static const imageURL = "image_url";
  static const doctorType = "type";
  static const doctorRoom = "room";
  static const diagnosis = "diagnosis";
  static const hystDiagnosis = "hist_diagnosis";
  static const role = "userRole";
  static const doctorID = "doctor_id";
  static const patientID = "patient_id";
  static const dateTime = "date_time";
  static const verificationStatus = "verification_status";
  static const createdAt = "created_at";
  static const treatment = "treatment";
  static const password = "password";
  static const email = "email";
}

abstract class UserRoles {
  static const patient = "patient";
  static const doctor = "doctor";
}