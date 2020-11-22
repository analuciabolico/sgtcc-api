package com.analuciabolico.sgtccapi.v1.boards.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;
import com.analuciabolico.sgtccapi.v1.classes.model.Class;
import com.analuciabolico.sgtccapi.v1.proposals.model.Proposal;
import com.analuciabolico.sgtccapi.v1.teachers.model.Teacher;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@Entity
@Table(name = "BOARDS")
@SequenceGenerator(name = "SEQ_BOARDS", sequenceName = "SEQUENCE_BOARDS", allocationSize = 1)
public class Board implements Serializable {

    @Builder
    public Board(Long id, @NonNull Teacher leader, @NonNull Class aClass, @NonNull Proposal proposal,
                 @NonNull LocalDateTime createdAt, @NonNull LocalDateTime dateScheduled) {
        this.id = id;
        this.leader = leader;
        this.aClass = aClass;
        this.proposal = proposal;
        this.createdAt = createdAt;
        this.dateScheduled = dateScheduled;
    }

    @Id
    @GeneratedValue(generator = "SEQ_BOARDS", strategy = GenerationType.SEQUENCE)
    private Long id;

    @NonNull
    @ManyToOne
    @JoinColumn(name = "FK_LEADER_UID", nullable = false)
    private Teacher leader;

    @NonNull
    @ManyToOne
    @JoinColumn(name = "FK_CLASS_UID", nullable = false)
    private Class aClass;

    @NonNull
    @ManyToOne
    @JoinColumn(name = "FK_PROPOSAL_UID", nullable = false)
    private Proposal proposal;

    @NonNull
    @Column(nullable = false, columnDefinition = "timestamp")
    protected LocalDateTime createdAt;

    @NonNull
    @Column(nullable = false, columnDefinition = "timestamp")
    protected LocalDateTime dateScheduled;
}
