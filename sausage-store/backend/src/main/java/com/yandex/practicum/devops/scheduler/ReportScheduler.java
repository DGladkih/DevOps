package com.yandex.practicum.devops.scheduler;

import com.yandex.practicum.devops.model.Report;
import com.yandex.practicum.devops.repository.ReportMongoRepository;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ReportScheduler {

    private final ReportMongoRepository reportRepo;

    public ReportScheduler(ReportMongoRepository reportRepo) {
        this.reportRepo = reportRepo;
    }

    @Scheduled(fixedRate = 300000)
    public void saveReportToMongo() {
        Report report = new Report("1", "OK", String.valueOf(System.currentTimeMillis()));
        reportRepo.save(report);
        System.out.println("? Report saved to MongoDB");
    }
}
