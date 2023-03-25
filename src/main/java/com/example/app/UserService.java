package com.example.app;

import com.example.app.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private KafkaTemplate<String, User> kafkaTemplate;

    public void sendUserToKafka(User user) {
        kafkaTemplate.send("my-kafka-topic", user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User addUser(User user) {
        return userRepository.save(user);
    }
}

