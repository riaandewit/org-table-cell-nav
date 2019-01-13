;; hopefully helps you zip around an org table, doing things...

(defun org-table-cell-value ()
	"Gives you the value of the cell. Always text - because you're in an org table."
  (chomp (buffer-substring-no-properties (progn (search-backward "|" nil t) (forward-char) (point)) (progn (search-forward "|" nil t) (backward-char) (point)))))

(defun org-table-cell-move-right (&optional count)
	"Move to the right. With no arguments, just one cell, with an argument (integer) - move that many cells right."
      (search-forward "|" nil t count))

(defun org-table-cell-move-left (&optional count)
	"Move to the left. With no arguments, just one cell, with an argument (integer) - move that many cells left."
      (search-backward "|" nil t count)
  (backward-char))

(defun org-table-cell-move-down (&optional count)
	"Move down. With no arguments, just one cell, with an argument (integer) - move that many cells down."
  (next-line count))

(defun org-table-cell-move-up (&optional count)
	"Move up. With no arguments, just one cell, with an argument (integer) - move that many cells up."
  (previous-line count))

