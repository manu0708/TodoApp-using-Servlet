package todoappproject.dto;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NonNull
	private String userName;
	@NonNull
	private String password;
	@NonNull
	private String email;
	@NonNull
	private long mobileNumber;
	@NonNull
	private String gender;
	@NonNull
	private LocalDate dateOfBirth;
}
