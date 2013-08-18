;; スーパークラス
(defclass super-classA ()
  ((slot-super-int :accessor get-super-int-a
		   :initform 100
		   :initarg :super-int)))
(defclass super-classB ()
  ((slot-super-int :accessor get-super-int-b
		   :initform 200
		   :initarg :super-int-b)))

;; クラス
(defclass cur-class (super-classA super-classB)
  (
   ;; アクセッサーあり
   (slot-int :accessor get-int		; int
	     :initform 1
	     :initarg :val)
   (slot-char :accessor get-char	; char
	      :initform "default"
	      :initarg :char)
   ;; アクセッサーなし
   (slot-no-acc :initform 1000
	       :initarg :no-acc)))

;; テストメソッド
(defun main ()
  (setq cls (make-instance 'cur-class))
  ;; アクセッサー
  (princ (get-int cls))
  (princ (get-char cls))		
  (princ (get-super-int-a cls))		 ; スーパークラスAのスロット
  (princ (get-super-int-b cls))		; スーパークラスBのスロット
  ;; slot-valueによるアクセス
  (princ (slot-value cls 'slot-int))	 ; アクセッサー有
  (princ (slot-value cls 'slot-no-acc))) ; アクセッサー無

(main)					; 実行